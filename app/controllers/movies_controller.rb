class MoviesController < ApplicationController

  GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

    def find_videos(keyword, after: 1.months.ago, before: Time.now)
      service = Google::Apis::YoutubeV3::YouTubeService.new
      service.key = GOOGLE_API_KEY

      next_page_token = nil
      opt = {
        q: keyword,
        type: 'video',
        max_results: 1,
        order: :date,
        page_token: next_page_token,
        published_after: after.iso8601,
        published_before: before.iso8601
      }
      service.list_searches(:snippet, opt)
    end

  def index
    @movies=Movie.all
  end

  def show
    @movie=Movie.find(params[:id])
    @movie.songs.each do |song|
    @youtube_search_videos = []
    @youtube_search_videos << find_videos("#{song.song} #{song.artist}")
  end
  end

  def new
    @movie=Movie.new
    @movie.songs.build
    @movie.tags.build
  end

  def create
    @movie=Movie.new(movie_params)
    @movie.end_user_id=current_end_user.id
    if @movie.save
    redirect_to movies_path
    else
       redirect_to root_path
    end
  end

  def edit
    @movie=Movie.find(params[:id])
  end

  def update
    @movie=Movie.find(params[:id])
    if @movie.update(movie_params)
    redirect_to movies_path
    else
       redirect_to root_path
    end
  end

  def destroy
    @movie=Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def title_search
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :url, :end_user_id, songs_attributes: [:id,:song,:artist], tags_attributes: [:id,:tag])
    end

end
