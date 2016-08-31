require 'rails_helper'

RSpec.describe OrderItemHistory, type: :model do
	it { is_expected.to belong_to(:order_item) }
end
