require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { is_expected.to have_many(:order_item_history) }
  it { is_expected.to validate_numericality_of(:quantity) }
end
