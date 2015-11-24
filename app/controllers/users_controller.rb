class UsersController < ApplicationController
  def index
  	@users = User.all
  	
  	@user = User.new
    @photo.caption = params[:caption]
    @photo.image = params[:image]
    @photo.user_id = params[:user_id]
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
  end
end