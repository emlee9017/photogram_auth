class PhotosController < ApplicationController
  before_action :protection, :only => [:edit, :update, :destroy]
  # skip_before_action :protection, :only => [:index]

  def protection
    @photo=Photo.find(params[:id])
    if current_user != @photo.user
      redirect_to root_url, :alert => "Not authorized for that."
    end
  end


  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.caption = params[:caption]
    @photo.image = params[:image]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.caption = params[:caption]
    @photo.image = params[:image]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
  
    @photo.destroy
  
    redirect_to "/photos", :notice => "Photo deleted."
  end
end
