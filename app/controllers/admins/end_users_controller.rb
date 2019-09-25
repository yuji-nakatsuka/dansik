class Admins::EndUsersController < ApplicationController

before_action :authenticate_admin!

  def index
    @users=EndUser.page(params[:page]).reverse_order.per(20)
  end

  def destroy
    @user=EndUser.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def show
    @end_user=EndUser.find(params[:id])
    @end_user_post=@end_user.movies.page(params[:page]).reverse_order.per(5)
  end

end
