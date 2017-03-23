class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :attendances, dependent: :destroy
  has_many :attends, through: :attendances, source: :event
  has_many :comments

  before_save :downcase_fields
  # before_create :password, :password_confirmation, presence: true

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, :city, :state, presence: true

  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  validates :password, length: { minimum: 8 }

  def downcase_fields
    self.email.downcase!
  end

end
