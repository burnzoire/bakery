require 'rails_helper'

RSpec.describe "order_item_histories/edit", type: :view do
  before(:each) do
    @order_item_history = assign(:order_item_history, OrderItemHistory.create!(
      :order_item => nil,
      :quantity => 1,
      :price => 1.5
    ))
  end

  it "renders the edit order_item_history form" do
    render

    assert_select "form[action=?][method=?]", order_item_history_path(@order_item_history), "post" do

      assert_select "input#order_item_history_order_item_id[name=?]", "order_item_history[order_item_id]"

      assert_select "input#order_item_history_quantity[name=?]", "order_item_history[quantity]"

      assert_select "input#order_item_history_price[name=?]", "order_item_history[price]"
    end
  end
end
