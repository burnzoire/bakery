require 'rails_helper'

RSpec.describe "OrderItemHistories", type: :request do
  describe "GET /order_item_histories" do
    it "works! (now write some real specs)" do
      get order_item_histories_path
      expect(response).to have_http_status(200)
    end
  end
end
