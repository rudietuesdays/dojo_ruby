class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: {case_sensitive: false }, format: { with: EMAIL_REGEX }

    has_many :posts
    has_many :messages
    has_many :owners
    has_many :blogs, through: :owners
    has_many :comments, as: :commentable
    has_many :friendships, class_name: "Friendship", foreign_key: "user_id"
    has_many :friends, through: :friendships

    #make friender accessible through friendee
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user
end
