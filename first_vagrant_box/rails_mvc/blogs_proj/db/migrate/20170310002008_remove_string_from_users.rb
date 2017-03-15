class RemoveStringFromUsers < ActiveRecord::Migration
  def change
      remove_column :users, :string # will also remove the index
  end
end
