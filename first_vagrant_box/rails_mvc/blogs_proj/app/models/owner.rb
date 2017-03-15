class Owner < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  def third_owner
      Blog.all.each { |blog| Owner.create(user: User.third, blog: blog) }
  end
end
