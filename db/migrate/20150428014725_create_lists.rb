class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.integer :items_count, default: 0, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
