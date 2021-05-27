class ClinicsController < ApplicationController
  before_action :find_clinic, only: [:show, :edit, :update, :destroy]

  def new
    @clinic = Clinic.new
    @clinic.build_location
    @clinic.clinic_departments.build
    @clinic.consultation_hours.build

    @departments = Department.all
    @areas = Area.all
    @dayofweeks = DayOfWeek.all
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.user_id = current_user.id

    redirect_to @clinic, notice: '作成しました' if @clinic.save
  end

  def edit
    @clinic = Clinic.find(params[:id])

    @departments = Department.all
    @areas = Area.all
    @dayofweeks = DayOfWeek.all
  end

  def update
    redirect_to @clinic, notice: '更新しました' if @clinic.update!(clinic_params)
  end

  def destroy
  end

  private

  def find_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(
      :clinic_name, :clinic_furigana, :clinic_admin_number, :director_name,
      :phone_number, :introduction, :pdf, :is_pdf_ony, :is_valid, location_attributes: [:id, :address, :post_address,:area_id],
      clinic_departments_attributes: [:id, :department_id], consultation_hours_attributes: [:id, :start_at, :end_at, {:day_of_week_id => []}]
    )
  end
end
