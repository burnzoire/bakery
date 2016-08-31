require 'rails_helper'

RSpec.describe "item_packs/show", type: :view do
  before(:each) do
    @item_pack = assign(:item_pack, ItemPack.create!(
      :item => nil,
      :quantity => 2,
      :price => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
  end
end
