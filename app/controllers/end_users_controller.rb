class EndUsersController < ApplicationController

  def show
    @end_user=EndUser.find(params[:id])
  end

  def edit
    @end_user=EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(user_params)
    redirect_to end_user_path(current_end_user.id)
  end

  def destroy

  end

  private
  def user_params
      params.require(:end_user).permit(:first_name, :last_name, :email)
  end

end
