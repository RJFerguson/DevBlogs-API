class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :company, :description, :link, :pubdate

  has_many :comments #, polymorphic: true

  
end
