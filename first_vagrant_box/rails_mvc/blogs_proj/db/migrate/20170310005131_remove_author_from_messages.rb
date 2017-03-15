class RemoveAuthorFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :author
  end
end
