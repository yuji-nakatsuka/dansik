class Admins::CommentsController < ApplicationController

before_action :authenticate_admin!
  def index
    @comments=Comment.page(params[:page]).reverse_order
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    redirect_to admins_comments_path
  end

end
