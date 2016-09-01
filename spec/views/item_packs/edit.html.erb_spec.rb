require 'rails_helper'

RSpec.describe "item_packs/edit", type: :view do
  before(:each) do
    @item_pack = assign(:item_pack, ItemPack.create!(
      :item => nil,
      :quantity => 1,
      :price => 1.5
    ))
  end

  it "renders the edit item_pack form" do
    render

    assert_select "form[action=?][method=?]", item_pack_path(@item_pack), "post" do

      assert_select "input#item_pack_item_id[name=?]", "item_pack[item_id]"

      assert_select "input#item_pack_quantity[name=?]", "item_pack[quantity]"

      assert_select "input#item_pack_price[name=?]", "item_pack[price]"
    end
  end
end
