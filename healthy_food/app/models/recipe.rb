class Recipe < ApplicationRecord
  belongs_to :user # means that one recipe has one user
  has_one_attached :image

  # the recipes that the user saved
  has_many :user_recipes
  has_many :users, through: :user_recipes


  # database validations
  validates :name, presence: true, length: {minimum: 2, maximum: 100}
  validates :description, presence: true, length: {minimum: 10}
  validates :user_id, presence: true


end
