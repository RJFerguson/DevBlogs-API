class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :comments, :comment_ids, :parent_id
 

  def parent_id
    object.commentable_id
  end 

  def parent 
    object.commentable_type
  end 

  def child_ids
  
  end 

  def comments
    object.comments.map do |comment|
      ::ChildSerializer.new(comment).attributes
    end
  end 

  
end
