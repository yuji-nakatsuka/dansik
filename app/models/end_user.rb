class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :first_name , format: {with: /\A[a-zA-Z]+\z/} #半角アルファベット（大文字・小文字）
         validates :last_name , format: {with: /\A[a-zA-Z]+\z/} #半角アルファベット（大文字・小文字）

         has_many :movies
         has_many :favorites
         has_many :comments
end
