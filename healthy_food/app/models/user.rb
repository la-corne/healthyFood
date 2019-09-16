class User < ApplicationRecord
  #belongs_to :recipe
  has_one_attached :profile_photo
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :user_diseases
  has_many :diseases , through: :user_diseases
  # database validations
  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 100}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}

  VALID_WEIGHT_HEIGHT_REGEX = /[0-9]+\.?[0-9]*/i
  validates :weight, presence: true,
            format: {with: VALID_WEIGHT_HEIGHT_REGEX}

  validates :height, presence: true,
            format: {with: VALID_WEIGHT_HEIGHT_REGEX}

  validates :gender, presence: true

  validates :first_name, presence: true, length: {minimum: 3, maximum: 100}

  validates :last_name, presence: true, length: {minimum: 3, maximum: 100}

  validates :birthdate, presence: true

  has_secure_password
  # validates :password, presence: true, length: {minimum: 6, maximum: 200}

end
