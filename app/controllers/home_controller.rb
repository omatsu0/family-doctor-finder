class HomeController < ApplicationController
  def index
    @clinics = Clinic.where(is_valid:true).order(:clinic_furigana)
  end
end
