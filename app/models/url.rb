class Url < ApplicationRecord
  has_many :users, through: :urls_users
  has_many :urls_users
  belongs_to :categorie
end
