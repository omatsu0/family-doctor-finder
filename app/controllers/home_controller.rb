class HomeController < ApplicationController

  def index
    @clinic = Clinic.find(16)
  end

end
