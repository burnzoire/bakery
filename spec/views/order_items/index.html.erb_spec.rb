require 'rails_helper'

RSpec.describe "order_items/index", type: :view do
  before(:each) do
    assign(:order_items, [
      OrderItem.create!(
        :order => nil,
        :item => nil,
        :quantity => 3
      ),
      OrderItem.create!(
        :order => nil,
        :item => nil,
        :quantity => 3
      )
    ])
  end

  it "renders a list of order_items" do
    render
    # todo: use FactoryGirl & properly check associated models
    #assert_select "tr>td", :text => nil.to_s, :count => 2
    #assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
