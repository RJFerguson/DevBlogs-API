class ChildSerializer < ActiveModel::Serializer
  attributes :id, :user, :content, :parent, :parent_id, :comments
 
# :comment_ids

  def parent_id
    if object.commentable_type == "Post"
      return 0
    else 
      return object.commentable_id
    end 
  end 

  def parent 
    object.commentable_type
  end 

  def comments
    object.comments.map do |comment|
      ::CommentSerializer.new(comment).attributes
    end
  end 

  
end
