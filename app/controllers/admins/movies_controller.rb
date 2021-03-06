class Admins::MoviesController < ApplicationController

before_action :authenticate_admin!

GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

  def find_videos(keyword)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 1,
      order: :relevance,
      page_token: next_page_token,
    }
    service.list_searches(:snippet, opt)
  end

  def index
    @movies=Movie.page(params[:page]).reverse_order
  end

  def show
    @movie=Movie.find(params[:id])
    @youtube_search_videos = []
    @itunes_search_songs = []
    @movie.songs.each do |song|
    @youtube_search_videos << find_videos("#{song.song} #{song.artist}")
    @itunes_search_songs << SearchClient.main("#{song.song}","#{song.artist}")
  end
    @comments=@movie.comments.all
    @comment=Comment.new
  end


  def  edit
    @movie=Movie.find(params[:id])
  end

  def update
    @movie=Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to admins_movies_path
  end

  def destroy
    @movie=Movie.find(params[:id])
    @movie.destroy
    redirect_to admins_movies_path
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :url, :end_user_id, songs_attributes: [:id,:song,:artist], tags_attributes: [:id,:tag])
    end

end
