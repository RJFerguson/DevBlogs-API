class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link, :pubdate, :commentable_id

  def commentable_id
    0
  end 
  has_many :comments #, polymorphic: true, serializer: PostCommentsSerializer 

  
end
