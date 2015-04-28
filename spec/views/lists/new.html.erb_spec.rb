require 'rails_helper'

RSpec.describe "lists/new", :type => :view do
  before(:each) do
    assign(:list, List.new(
      :name => "MyString",
      :items_count => 1,
      :user => nil
    ))
  end

  it "renders new list form" do
    render

    assert_select "form[action=?][method=?]", lists_path, "post" do

      assert_select "input#list_name[name=?]", "list[name]"

      assert_select "input#list_items_count[name=?]", "list[items_count]"

      assert_select "input#list_user_id[name=?]", "list[user_id]"
    end
  end
end
