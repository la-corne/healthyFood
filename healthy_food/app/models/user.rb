class User < ApplicationRecord
  #belongs_to :recipe
  has_one_attached :profile_photo
  has_many :posts
  has_many :comments
  has_many :recipes

  # database validations
  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 100}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}

  validates :weight, presence: true, length: {minimum: 1, maximum: 3}

  validates :height, presence: true, length: {minimum: 1, maximum: 3}

  validates :gender, presence: true

  validates :first_name, presence: true, length: {minimum: 3, maximum: 100}

  validates :last_name, presence: true, length: {minimum: 3, maximum: 100}

  validates :is_specialist, presence: true

  validates :brithdate, presence: true

  has_secure_password
  validates :password, presence: true, length: {minimum: 6, maximum: 200}

end
