require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:item) }

  let(:invalid_attributes) { FactoryGirl.attributes_for(:item, code: "") }

  let(:valid_session) { {} }

  let(:item) { FactoryGirl.create(:item)}

  describe "GET #index" do
    it "assigns all items as @items" do
      get :index, {}, session: valid_session
      expect(assigns(:items)).to eq([item])
    end
  end

  describe "GET #show" do
    it "assigns the requested item as @item" do
      get :show, id: item.to_param, session: valid_session
      expect(assigns(:item)).to eq(item)
    end
  end

  describe "GET #new" do
    it "assigns a new item as @item" do
      get :new, {}, session: valid_session
      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe "GET #edit" do
    it "assigns the requested item as @item" do
      get :edit, id: item.to_param, session: valid_session
      expect(assigns(:item)).to eq(item)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, item: valid_attributes, session: valid_session
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, item: valid_attributes, session: valid_session
        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it "redirects to the created item" do
        post :create, item: valid_attributes, session: valid_session
        expect(response).to redirect_to(Item.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved item as @item" do
        post :create, item: invalid_attributes, session: valid_session
        expect(assigns(:item)).to be_a_new(Item)
      end

      it "re-renders the 'new' template" do
        post :create, item: invalid_attributes, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:item, name: "Marmite Scroll")
      }

      it "updates the requested item" do
        put :update, id: item.to_param, item: new_attributes, session: valid_session
        item.reload
        expect(item.name).to eq(new_attributes[:name])
      end

      it "assigns the requested item as @item" do
        put :update, id: item.to_param, item: valid_attributes, session: valid_session
        expect(assigns(:item)).to eq(item)
      end

      it "redirects to the item" do
        put :update, id: item.to_param, item: valid_attributes, session: valid_session
        expect(response).to redirect_to(item)
      end
    end

    context "with invalid params" do
      it "assigns the item as @item" do
        put :update, id: item.to_param, item: invalid_attributes, session: valid_session
        expect(assigns(:item)).to eq(item)
      end

      it "re-renders the 'edit' template" do
        put :update, id: item.to_param, item: invalid_attributes, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:item) { FactoryGirl.create(:item)}
    it "destroys the requested item" do
      expect {
        delete :destroy, id: item.to_param, session: valid_session
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      delete :destroy, id: item.to_param, session: valid_session
      expect(response).to redirect_to(items_url)
    end
  end

end
