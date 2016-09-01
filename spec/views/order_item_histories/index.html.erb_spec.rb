require 'rails_helper'

RSpec.describe "order_item_histories/index", type: :view do
  before(:each) do
    assign(:order_item_histories, [
      OrderItemHistory.create!(
        :order_item => nil,
        :quantity => 2,
        :price => 3.5
      ),
      OrderItemHistory.create!(
        :order_item => nil,
        :quantity => 2,
        :price => 3.5
      )
    ])
  end

  it "renders a list of order_item_histories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
