class CreateListAuthorizations < ActiveRecord::Migration
  def change
    create_table :list_authorizations do |t|
      t.integer :share_list_id
      t.integer :share_user_id

      t.timestamps null: false
    end
  end
end
