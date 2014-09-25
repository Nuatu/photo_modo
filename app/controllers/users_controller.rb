class UsersController < ApplicationController

  before_filter :authorize, only: [:show]

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

    if @user.id == session[:user_id]
      render 'show'
    else
      redirect_to user_path(session[:user_id])
    end
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
