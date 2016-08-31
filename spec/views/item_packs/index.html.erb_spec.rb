require 'rails_helper'

RSpec.describe "item_packs/index", type: :view do
  before(:each) do
    assign(:item_packs, [
      ItemPack.create!(
        :item => nil,
        :quantity => 2,
        :price => 3.5
      ),
      ItemPack.create!(
        :item => nil,
        :quantity => 2,
        :price => 3.5
      )
    ])
  end

  it "renders a list of item_packs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
