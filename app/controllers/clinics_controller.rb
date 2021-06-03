class ClinicsController < ApplicationController
  before_action :find_clinic, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    @clinics = Clinic.where(is_valid:true).order(:clinic_furigana)
  end

  def new
    @clinic = Clinic.new
    @clinic.consultation_hours.build
    @clinic.clinic_departments.build
    @clinic.build_location

    @dayofweeks=DayOfWeek.all
    @departments = Department.all
    @areas = Area.all
  end

  def create
    @clinic = Clinic.new(clinic_params)
    # @clinic.user_id = current_user.id

    if @clinic.save!
      redirect_to clinics_path, notice: "病院を登録しました"
    else
      render :new, notice: "登録に失敗しました"
    end
  end

  def edit
    @clinic = Clinic.find(params[:id])

    @departments = Department.all
  end

  def update
    @clinic.user_id = current_user.id
    redirect_to @clinic, notice: '更新しました' if @clinic.update!(clinic_params)
  end

  def show
    clinic_id=@clinic.id
    @announcements = Announcement.where(clinic_id:clinic_id,is_valid:true)
  end

  def destroy
  end

  def search
    @results = @q.result
  end

  def download
    @clinic = Clinic.find(params[:clinic_id])
    # ref: https://github.com/carrierwaveuploader/carrierwave#activerecord
    filepath = @clinic.pdf.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @clinic.pdf_identifier, :length => stat.size)

  end

  private

  def find_clinic
    @clinic = Clinic.find(params[:id])
  end

  def set_q
    @q = Clinic.ransack(params[:q])
  end

  def clinic_params
    params
      .require(:clinic).permit(
        :clinic_name, :clinic_furigana, :clinic_admin_number, :director_name,
        :phone_number, :introduction, :pdf, :is_pdf_ony, :is_valid,
        clinic_departments_attributes: [:id, :department_id],
        location_attributes: [:id, :address, :post_address,:area_id],
        consultation_hours_attributes: [:id, :start_at, :end_at,:_destroy, :day_of_week_id ]).merge(user_id: current_user.id)
  end

end
