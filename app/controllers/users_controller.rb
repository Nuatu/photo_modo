class UsersController < ApplicationController

  # def index
  #   @users = User.all
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: "Thank you for signing up!"

    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @image = Image.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # @image = Image.new
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Image uploaded"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render "destroy"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
