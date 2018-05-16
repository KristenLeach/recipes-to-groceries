class CreateMealPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_plans do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
