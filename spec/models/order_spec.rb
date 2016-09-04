require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to have_many(:order_items) }
  it { is_expected.to have_many(:order_item_histories) }
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to validate_presence_of(:customer) }
end
