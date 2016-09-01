require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :customer => Customer.create!
      ),
      Order.create!(
        :customer => Customer.create!
      )
    ])
  end

  #it "renders a list of orders" do
  #  render
  #  assert_select "tr>td", :text => //, :count => 2
  #end
end
