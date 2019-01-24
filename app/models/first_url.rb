class FirstUrl < ApplicationRecord
  belongs_to :categorie
  belongs_to :user

  validates :name, presence: true
end
