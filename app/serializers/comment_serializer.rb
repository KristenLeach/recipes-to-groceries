class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :recipe_id, :content, :created_at
  belongs_to :user, serializer: CommentUserSerializer
  belongs_to :recipe
end
