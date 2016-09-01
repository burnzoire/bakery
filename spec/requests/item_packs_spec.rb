require 'rails_helper'

RSpec.describe "ItemPacks", type: :request do
  describe "GET /item_packs" do
    it "works! (now write some real specs)" do
      get item_packs_path
      expect(response).to have_http_status(200)
    end
  end
end
