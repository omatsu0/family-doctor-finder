class AreaController < ApplicationController
  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    area = @area.id
    @locations = Location.where(area_id: area)
  end
end
