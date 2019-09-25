class EndUsersController < ApplicationController

  before_action :authenticate_end_user!

  def show
    @end_user=EndUser.find(params[:id])
  end

  def edit
    @end_user=EndUser.find(params[:id])
  end

  def index
    @end_user=EndUser.find(params[:end_user_id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(user_params)
    redirect_to end_user_path(current_end_user.id)
  end

  def destroy
    @user=EndUser.find(current_end_user.id)
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
      params.require(:end_user).permit(:first_name, :last_name, :email)
  end

end
