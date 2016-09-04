require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to have_many(:order_items) }
  it { is_expected.to have_many(:order_item_histories) }
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to validate_presence_of(:customer) }

  context "with code challenge input" do
    let!(:order) { FactoryGirl.create(:order_demo) }

    it "has 10 x VS5 for 17.98" do
      expect(order.order_items[0].quantity).to eq(10)
      expect(order.order_items[0].subtotal).to eq(17.98)
    end

    it "has 14 x MB11 for 54.8" do
      expect(order.order_items[1].quantity).to eq(14)
      expect(order.order_items[1].subtotal).to eq(54.8)
    end

    it "has 13 x CF for 25.85" do
      expect(order.order_items[2].quantity).to eq(13)
      expect(order.order_items[2].subtotal).to eq(25.85)
    end
  end

end
