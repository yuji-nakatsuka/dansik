class Admins::EndUsersController < ApplicationController

before_action :authenticate_admin!

  def index
    @users=EndUser.all
  end

  def destroy
    @user=EndUser.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def show
    @end_user=EndUser.find(params[:id])
  end

end
