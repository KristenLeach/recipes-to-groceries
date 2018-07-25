class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :image
  has_many :recipes, serializer: RecipeUserSerializer
  has_many :comments, serializer: CommentUserSerializer
end
