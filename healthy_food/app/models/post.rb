class Post < ApplicationRecord
  belongs_to :user # means that one post has one user
 # belongs_to :comment
  has_one_attached :description_image
  has_many :comments

  # the posts that the user saved
  has_many :user_posts
  has_many :users, through: :user_posts

 # database validations
  validates :user_id, presence: true
end
