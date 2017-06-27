class UserBlogPost < ApplicationRecord
  belongs_to :userblog
  has_many :userblogcomments
  has_many :userblogposts, through: :userblog
end
