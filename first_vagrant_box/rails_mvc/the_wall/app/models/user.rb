class User < ActiveRecord::Base
  validates :username, presence: true, length: { minimum: 6 }, uniqueness: { case_sensitive: false }
end
