class UserBlogComment < ApplicationRecord
  belongs_to :user 
  belongs_to :userblogposts
end
