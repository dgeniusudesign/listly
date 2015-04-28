class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_password_set, :boolean, default: false, null: false
  end
end
