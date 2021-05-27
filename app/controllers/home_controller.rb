class HomeController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @clinics = Clinic.where(is_valid:true).order(:clinic_furigana)
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Clinic.ransack(params[:q])
  end

end
