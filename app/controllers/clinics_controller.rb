class ClinicsController < ApplicationController
  before_action :find_clinic, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]
  before_action :set_areas, only: [:new, :create, :edit, :update]
  before_action :set_dayofweeks, only: [:new, :create, :edit, :update]
  before_action :set_departments, only: [:new, :create, :edit, :update]

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
    # @areas = Area.all
  end

  def create
    @clinic = Clinic.new(clinic_params)
    # @clinic.consultation_hours_attributes.day_of_week_id=current_user.id
    # @clinic.user_id = current_user.id
    # binding.pry
    # @clinic.consultation_hours.day_of_week_id=current_user.id

    if @clinic.save
      redirect_to clinics_path, notice: "病院を登録しました"
    else
      render :new, notice: "登録に失敗しました"
    end
  end

  def edit
    @clinic = Clinic.find(params[:id])

    # @dayofweeks=DayOfWeek.all
    # @departments = Department.all
    # @areas = Area.all
  end

  def update
    @clinic.user_id = current_user.id
    if @clinic.update!(clinic_params)
      redirect_to @clinic, notice: '更新しました'
    else
      render :show
    end
  end

  def show
    clinic_id=@clinic.id
    @announcements = Announcement.where(clinic_id:clinic_id,is_valid:true)
    @consul_hours = ConsultationHour.where(clinic_id: clinic_id).pluck(:start_at)
    @weeks=DayOfWeek.all
  end

  def destroy
  end

  def search
    @results = @q.result
  end

  def download
    @clinic = Clinic.find(params[:clinic_id])

    region='ap-northeast-1'
    bucket='fd-finder'
    key ="uploads/clinic/pdf/#{@clinic.id}/#{@clinic.pdf_identifier}"
    credentials=Aws::Credentials.new(
      ENV['AWS_ACCESS_KEY_ID'],
      ENV['AWS_SECRET_ACCESS_KEY']
    )
    client=Aws::S3::Client.new(region:region, credentials:credentials)
    data=client.get_object(bucket:bucket, key:key).body
    send_data data.read, filename: params[:file_name], disposition: 'attachment'

  end

  # def show_weeks
  #   @clinic = Clinic.find(params[:clinic_id])
  #   @openday=[]

  #   @clinic.consultation_hours.each do|hour|
  #     hour.dayofweekn.each do |i|
  #       @week_id=DayOfWeek.where(id: i)
  #       Openday << @week_id.name
  #     end
  #   end
  # end

  private

  def find_clinic
    @clinic = Clinic.find(params[:id])
  end

  def set_q
    @q = Clinic.ransack(params[:q])
  end

  def set_areas
    @areas = Area.all
  end

  def set_dayofweeks
    @dayofweeks = DayOfWeek.all
  end

  def set_departments
    @departments = Department.all
  end

  def clinic_params
    params
      .require(:clinic).permit(
        :clinic_name, :clinic_furigana, :clinic_admin_number, :director_name,
        :phone_number, :introduction, :pdf, :pdf_cache, :remove_pdf, :is_pdf_ony, :is_valid,
        clinic_departments_attributes: [:id, :department_id,:_destroy,],
        location_attributes: [:id, :address, :post_address,:area_id],
        consultation_hours_attributes: [:id, :start_at, :end_at,:_destroy,{ day_of_weeks:[] } ]).merge(user_id: current_user.id)
  end

end