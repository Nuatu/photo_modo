class ImagesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @image = @user.images.new
    @images = Image.all
  end

  def new
    @image = Image.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)
    if @image.save
      session[:image_id] = @image.id
      redirect_to user_path(@user), notice: "Image uploaded"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:image).permit(:name, :photo, :user_id)
  end
end
