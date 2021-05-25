class ClinicsController < ApplicationController
  before_action :find_clinic, only: [:show, :edit, :update, :destroy]

  def new
    @clinic = Clinic.new
    @clinic.build_location
    @clinic.clinic_departments.build
    @clinic.build_consultation_hours

    @departments = Department.all
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.user_id = current_user.id

    redirect_to @clinic, notice: '作成しました' if @clinic.save
  end

  def edit
  end

  def update

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
      :phone_number, :introduction, :pdf, :is_pdf_ony, :is_valid, location_attributes: [:id, :address, :post_address],
      clinic_departments_attributes: [:id, :department_id]
    )
  end
end
