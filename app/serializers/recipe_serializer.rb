class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :ingredients, :image, :directions, :user_id
  belongs_to :user
  has_many :hearts
end
