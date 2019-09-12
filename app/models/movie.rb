class Movie < ApplicationRecord
  has_many :songs
  has_many :comments
  has_many :tags
  belongs_to :end_user

  accepts_nested_attributes_for :songs, allow_destroy: true
  accepts_nested_attributes_for :tags, allow_destroy: true

  def favorited_by?(user)
         favorites.where(end_user_id: user.id).exists?
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
