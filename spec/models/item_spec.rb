require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to have_many(:item_packs) }
  it { is_expected.to have_many(:order_items) }
end
