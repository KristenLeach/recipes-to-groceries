class AddNoteToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :note, :string
  end
end
