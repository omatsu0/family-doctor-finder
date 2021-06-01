class ClinicsController < ApplicationController
  before_action :find_clinic, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    @clinics = Clinic.where(is_valid:true).order(:clinic_furigana)
  end

  def new
    @clinic = Form::Clinic.new
  end

  def create
    @clinic = Form::Clinic.new(clinic_params)
    @clinic.user_id = current_user.id

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
      .require(:form_clinic)
      .permit(
        Form::Clinic::REGISTRABLE_ATTRIBUTES +
        [consultation_hours_attributes: Form::ConsultationHour::REGISTRABLE_ATTRIBUTES])
    end

end
