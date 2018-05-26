class AddLikedToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :liked, :boolean, :default => false 
  end
end
