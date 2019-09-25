class CommentsController < ApplicationController

  def destroy
  end

  def create
    @movie=Movie.find(params[:movie_id])
    @comment=current_end_user.comments.new(comment_params)
    @comment.movie_id=params[:movie_id]
    if @comment.save
    redirect_to movie_path(@movie)
    end
  end

private
  def comment_params
    params.require(:comment).permit(:comment,:end_user_id,:movie_id)
  end
end
