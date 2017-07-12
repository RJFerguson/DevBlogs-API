class User < ApplicationRecord
  has_secure_password
  has_many :authorizations
  validates :name, :email, :presence => true
  has_many :comments, as: :commentable 
end
