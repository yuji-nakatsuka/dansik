class Tag < ApplicationRecord
  belongs_to :movie

  def self.tag_search(search)
      Tag.where(['tag LIKE ?',"%#{search}%"])
  end
end
