class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :content, :user, :event, presence: true
end
