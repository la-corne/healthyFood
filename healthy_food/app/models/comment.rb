class Comment < ApplicationRecord
  belongs_to :user # means that one comment has one user
  belongs_to :post # means that one comment has one post

  # database validations
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :comment, presence: true,length: {minimum: 1}



end
