class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :ingredients, array: true, default: []
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
