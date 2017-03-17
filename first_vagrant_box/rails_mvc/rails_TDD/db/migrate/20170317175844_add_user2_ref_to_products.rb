class AddUser2RefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :user, foreign_key: true
  end
end
