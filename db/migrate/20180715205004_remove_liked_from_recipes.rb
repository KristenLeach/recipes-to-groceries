class RemoveLikedFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :liked
  end
end
