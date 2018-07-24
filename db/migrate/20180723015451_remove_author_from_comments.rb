class RemoveAuthorFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :author
  end
end
