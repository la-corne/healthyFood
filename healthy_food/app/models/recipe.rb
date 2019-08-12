class Recipe < ApplicationRecord
  belongs_to :user # means that one recipe has one user
  has_one_attached :image

  # database validations
  validates :name, presence: true,length: {minimum: 2,maximum: 100}
  validates :description, presence: true,length: {minimum:10}
  validates :user_id, presence: true
end
