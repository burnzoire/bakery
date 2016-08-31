require 'rails_helper'

RSpec.describe "order_item_histories/new", type: :view do
  before(:each) do
    assign(:order_item_history, OrderItemHistory.new(
      :order_item => nil,
      :quantity => 1,
      :price => 1.5
    ))
  end

  it "renders new order_item_history form" do
    render

    assert_select "form[action=?][method=?]", order_item_histories_path, "post" do

      assert_select "input#order_item_history_order_item_id[name=?]", "order_item_history[order_item_id]"

      assert_select "input#order_item_history_quantity[name=?]", "order_item_history[quantity]"

      assert_select "input#order_item_history_price[name=?]", "order_item_history[price]"
    end
  end
end
