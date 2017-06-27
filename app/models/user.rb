class User < ApplicationRecord
  has_many :comments
  has_many :userblogcomments
  has_one :userblog
  has_many :userblogposts, through: :userblog
end
