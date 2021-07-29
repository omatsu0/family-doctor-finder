class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
    @announses=Announcement.where(user_id: @user.id)
    @post_clinics = Clinic.includes({ location: [:area]} ).where(user_id: @user.id)
  end
end
