class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :ingredients, :image, :directions, :user_id, :hearts
  belongs_to :user, serializer: RecipeUserSerializer
end
