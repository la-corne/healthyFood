class Post < ApplicationRecord
  belongs_to :user # means that one post has one user
 # belongs_to :comment
  has_one_attached :description_image
  has_many :comments

 # database validations
  validates :user_id, presence: true
end
