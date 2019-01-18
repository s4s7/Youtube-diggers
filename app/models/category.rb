class Category < ApplicationRecord
  has_many :first_urls
  has_many :second_urls
  has_many :third_urls
end
