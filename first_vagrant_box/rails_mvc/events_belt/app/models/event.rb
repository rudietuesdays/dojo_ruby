class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  has_many :comments

  validates :name, :date, :city, :state, :user, presence: true

  validate :future_date

  def future_date
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
