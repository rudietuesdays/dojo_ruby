class Secret < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
  validates :content, :user, presence: true
end
