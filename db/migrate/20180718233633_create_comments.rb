class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.string :author
      t.text :content
      t.timestamps
    end
  end
end
