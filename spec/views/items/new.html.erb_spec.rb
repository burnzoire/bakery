require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :code => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_code[name=?]", "item[code]"

      assert_select "input#item_name[name=?]", "item[name]"
    end
  end
end
