require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :code => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_code[name=?]", "item[code]"

      assert_select "input#item_name[name=?]", "item[name]"
    end
  end
end
