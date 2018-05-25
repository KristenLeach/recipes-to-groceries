class AddDefaultValueToNoteInMeals < ActiveRecord::Migration[5.2]
  def change
    change_column :meals, :note, :string, :default => nil
  end
end
