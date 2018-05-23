class DropTableMealPlans < ActiveRecord::Migration[5.2]
  def change
    drop_table :meal_plans
  end
end
