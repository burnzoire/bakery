require 'rails_helper'

RSpec.describe ItemPack, type: :model do
  it { is_expected.to belong_to(:item) }
  it { is_expected.to validate_numericality_of(:quantity) }
  it { is_expected.to validate_numericality_of(:price) }
end
