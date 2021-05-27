class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])

    @user_clinics = Clinic.where(user_id: @user.id)
  end
end
