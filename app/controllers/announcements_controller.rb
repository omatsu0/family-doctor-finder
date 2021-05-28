class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @clinic = Clinic.find(params[:clinic_id])
    @announce = Announcement.new
  end

  def create
    @clinic = Clinic.find(params[:clinic_id])
    @announce = Announcement.new(announce_params)
    @announce.clinic_id = @clinic.id
    @announce.user_id = current_user.id

    redirect_to @clinic, notice: 'お知らせを追加しました' if @announce.save!

  end

  def edit
    @announce = Announcement.find(params[:id])
    @clinic = Clinic.find(params[:clinic_id])
  end

  def update
    @announce = Announcement.find(params[:id])
    @clinic = Clinic.find(params[:clinic_id])
    @announce.clinic_id = @clinic.id
    @announce.user_id = current_user.id

    redirect_to @clinic, notice: 'お知らせを更新しました' if @announce.update!(announce_params)
  end

  private

  def find_announce
    @announce = Announcement.find(params[:id])
  end

  def announce_params
    params.require(:announcement).permit(:body, :is_valid, :priority)
  end

end
