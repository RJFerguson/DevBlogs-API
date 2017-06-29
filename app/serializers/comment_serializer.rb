class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :commentable_id, :commentable_type, :comments

  def comments
    object.comments.map do |comment|
      ::CommentSerializer.new(comment).attributes
    end
  end 
  belongs_to :post
  
end
