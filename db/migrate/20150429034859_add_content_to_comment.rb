class AddContentToComment < ActiveRecord::Migration
  def change
    add_column :comments, :content, :string, null: false, default: ""
  end
end
