class UserBlog < ApplicationRecord
  belongs_to :user
  has_many :userblogposts
end
