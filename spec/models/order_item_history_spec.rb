require 'rails_helper'

RSpec.describe OrderItemHistory, type: :model do
	it { is_expected.to belong_to(:order_item) }

  it { is_expected.to validate_numericality_of(:quantity) }
  it { is_expected.to validate_numericality_of(:price) }
end
