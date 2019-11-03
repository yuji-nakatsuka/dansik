class Movie < ApplicationRecord
  has_many :songs,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :tags,dependent: :destroy
  belongs_to :end_user

  accepts_nested_attributes_for :songs, allow_destroy: true
  accepts_nested_attributes_for :tags, allow_destroy: true

  def favorited_by?(user)
         favorites.where(end_user_id: user.id).exists?
       end
   #exists＝データが存在するかどうか

  def self.search(search)
    if search
      Movie.where(['title LIKE ?',"%#{search}%"])
    else
      Movie.all
    end
  end

  def self.create_all_ranks
      Movie.find(Favorite.group(:movie_id).order('count(movie_id) desc').limit(10).pluck(:movie_id))
    end


end




require 'itunes-search-api'

class SearchClient
    def self.main(song,artist)


        ITunesSearchAPI.search(
            :term    => "#{song} #{artist}",
            :country => 'jp',
            :media   => 'music',
            :lang    => 'ja_jp',
            :limit  => '1'
            )
    end
end
