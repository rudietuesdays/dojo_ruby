class User < ActiveRecord::Base
    has_many :messages

    # this method is the same as has_many :messages !!
    # def messages
    #     User.find_by_sql("SELECT * FROM messages WHERE messages.user_id = #{self.id}")

    has_many :signups
    has_many :courses, through: :signups

    end
end
