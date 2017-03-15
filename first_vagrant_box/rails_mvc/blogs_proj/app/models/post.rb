class Post < ActiveRecord::Base
    validates :title, :content, presence: true
    validates :title, length: { minimum: 5 }

    belongs_to :blog, :dependent => :delete
    belongs_to :user, :dependent => :delete
    has_many :comments, as: :commentable
    has_many :messages
end
