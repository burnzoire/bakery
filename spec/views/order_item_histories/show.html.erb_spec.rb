require 'rails_helper'

RSpec.describe "order_item_histories/show", type: :view do
  before(:each) do
    @order_item_history = assign(:order_item_history, OrderItemHistory.create!(
      :order_item => nil,
      :quantity => 2,
      :price_per_pack => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
  end
end
