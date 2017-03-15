class Message < ActiveRecord::Base
    validates :message, presence: true
    validates :message, length: { minimum: 15 }

    belongs_to :post, :dependent => :delete
    belongs_to :user, :dependent => :delete
    has_many :comments, as: :commentable
end
