require "rails_helper"

RSpec.describe ItemPacksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_packs").to route_to("item_packs#index")
    end

    it "routes to #new" do
      expect(:get => "/item_packs/new").to route_to("item_packs#new")
    end

    it "routes to #show" do
      expect(:get => "/item_packs/1").to route_to("item_packs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/item_packs/1/edit").to route_to("item_packs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/item_packs").to route_to("item_packs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_packs/1").to route_to("item_packs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_packs/1").to route_to("item_packs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_packs/1").to route_to("item_packs#destroy", :id => "1")
    end

  end
end
