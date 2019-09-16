class Disease < ApplicationRecord
  has_many :user_diseases
  has_many :users, through: :user_diseases


  # database validations
  validates :name, presence: true,
            uniqueness: {case_sensitive: false}
end
