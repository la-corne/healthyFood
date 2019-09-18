class SavedPost < ApplicationRecord
  belongs_to :user
  belongs_to :savedpost, class_name: 'Post'
end
