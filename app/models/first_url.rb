class FirstUrl < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true
end
