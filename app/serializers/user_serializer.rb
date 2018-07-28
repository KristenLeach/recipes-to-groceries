class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :hearts
  has_many :recipes, serializer: RecipeUserSerializer
  has_many :comments, serializer: CommentUserSerializer
  has_many :hearts
end
