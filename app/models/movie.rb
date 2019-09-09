class Movie < ApplicationRecord
  has_many :songs
  has_many :comments
  has_many :tags
  belongs_to :end_user

  accepts_nested_attributes_for :songs, allow_destroy: true
  accepts_nested_attributes_for :tags, allow_destroy: true
end
