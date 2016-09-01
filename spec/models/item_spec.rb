require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to have_many(:item_packs) }
  it { is_expected.to have_many(:order_items) }
  it { is_expected.to validate_uniqueness_of(:code) }
  it { is_expected.to validate_presence_of(:name) }
end
