class ChangeUidFromIntegerToText < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :uid, :text
  end
end
