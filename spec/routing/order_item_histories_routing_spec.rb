require "rails_helper"

RSpec.describe OrderItemHistoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/order_item_histories").to route_to("order_item_histories#index")
    end

    it "routes to #new" do
      expect(:get => "/order_item_histories/new").to route_to("order_item_histories#new")
    end

    it "routes to #show" do
      expect(:get => "/order_item_histories/1").to route_to("order_item_histories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/order_item_histories/1/edit").to route_to("order_item_histories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/order_item_histories").to route_to("order_item_histories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/order_item_histories/1").to route_to("order_item_histories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/order_item_histories/1").to route_to("order_item_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/order_item_histories/1").to route_to("order_item_histories#destroy", :id => "1")
    end

  end
end
