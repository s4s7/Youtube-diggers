class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :urls, through: :first_urls
  has_many :second_urls
  has_many :third_urls
end
