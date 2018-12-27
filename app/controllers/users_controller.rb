class UsersController < ApplicationController
  before_action :authentication_required
  skip_before_action :authentication_required, only: [:new]

  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    
  end

  def create
    @user = User.new(user_params)
    @user.save

    redirect_to user_path(current_user)
  end

  def new
    @user = User.new
    
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin, project_ids:[])
  end
end
