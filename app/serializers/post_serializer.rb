class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link, :pubdate

  has_many :comments #, polymorphic: true

  
end
