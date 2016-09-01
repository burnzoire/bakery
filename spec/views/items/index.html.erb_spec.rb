require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :code => "Code1",
        :name => "Name"
      ),
      Item.create!(
        :code => "Code2",
        :name => "Name"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => /Code/, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
