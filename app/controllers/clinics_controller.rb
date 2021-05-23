class ClinicsController < ApplicationController
  def show
    @clinic = Clinic.find(params[:id])
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.user_id = current_user.id

    redirect_to @clinic, notice: '作成しました' if @clinic.save
  end

  private

  def clinic_params
    params.require(:clinic).permit(
      :clinic_name, :clinic_furigana, :clinic_admin_number, :director_name,
      :phone_number, :introduction, :pdf, :is_pdf_ony, :is_valid
    )
  end
end
