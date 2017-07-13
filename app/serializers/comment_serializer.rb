class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user ,:content, :parent, :parent_id, :comments

  def parent_id
    if object.commentable_type == "Post"
      return 0
    else 
      return object.commentable_id
      # object.commentable_id
    end 
  end 

  def parent 
    object.commentable_type
  end 

  def comments
    object.comments.map do |comment|
      ::ChildSerializer.new(comment).attributes
    end
  end 

  
end
