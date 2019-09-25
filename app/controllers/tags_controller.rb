class TagsController < ApplicationController

  def tag_search
    @tag_searches=Tag.where(['tag LIKE ?',"%#{params[:tag]}%"]).order(id: "DESC")
  end

end
