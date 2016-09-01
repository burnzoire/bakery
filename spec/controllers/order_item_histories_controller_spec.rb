require 'rails_helper'

RSpec.describe OrderItemHistoriesController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:order_item_history) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:order_item_history, price: "free") }

  let(:valid_session) { {} }

  let(:order_item_history) { FactoryGirl.create(:order_item_history) }

  describe "GET #index" do
    it "assigns all order_item_histories as @order_item_histories" do
      get :index, {}, session: valid_session
      expect(assigns(:order_item_histories)).to eq([order_item_history])
    end
  end

  describe "GET #show" do
    it "assigns the requested order_item_history as @order_item_history" do
      get :show, id: order_item_history.to_param, session: valid_session
      expect(assigns(:order_item_history)).to eq(order_item_history)
    end
  end

  describe "GET #new" do
    it "assigns a new order_item_history as @order_item_history" do
      get :new, {}, session: valid_session
      expect(assigns(:order_item_history)).to be_a_new(OrderItemHistory)
    end
  end

  describe "GET #edit" do
    it "assigns the requested order_item_history as @order_item_history" do
      get :edit, id: order_item_history.to_param, session: valid_session
      expect(assigns(:order_item_history)).to eq(order_item_history)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new OrderItemHistory" do
        expect {
          post :create, order_item_history: valid_attributes, session: valid_session
        }.to change(OrderItemHistory, :count).by(1)
      end

      it "assigns a newly created order_item_history as @order_item_history" do
        post :create, order_item_history: valid_attributes, session: valid_session
        expect(assigns(:order_item_history)).to be_a(OrderItemHistory)
        expect(assigns(:order_item_history)).to be_persisted
      end

      it "redirects to the created order_item_history" do
        post :create, order_item_history: valid_attributes, session: valid_session
        expect(response).to redirect_to(OrderItemHistory.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved order_item_history as @order_item_history" do
        post :create, order_item_history: invalid_attributes, session: valid_session
        expect(assigns(:order_item_history)).to be_a_new(OrderItemHistory)
      end

      it "re-renders the 'new' template" do
        post :create, order_item_history: invalid_attributes, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:order_item_history, price: 99.99)
      }

      it "updates the requested order_item_history" do
        put :update, id: order_item_history.to_param, order_item_history: new_attributes, session: valid_session
        order_item_history.reload
        expect(order_item_history.price).to eq(new_attributes[:price])
      end

      it "assigns the requested order_item_history as @order_item_history" do
        put :update, id: order_item_history.to_param, order_item_history: valid_attributes, session: valid_session
        expect(assigns(:order_item_history)).to eq(order_item_history)
      end

      it "redirects to the order_item_history" do
        put :update, id: order_item_history.to_param, order_item_history: valid_attributes, session: valid_session
        expect(response).to redirect_to(order_item_history)
      end
    end

    context "with invalid params" do
      it "assigns the order_item_history as @order_item_history" do
        put :update, id: order_item_history.to_param, order_item_history: invalid_attributes, session: valid_session
        expect(assigns(:order_item_history)).to eq(order_item_history)
      end

      it "re-renders the 'edit' template" do
        put :update, id: order_item_history.to_param, order_item_history: invalid_attributes, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:order_item_history) { FactoryGirl.create(:order_item_history) }
    it "destroys the requested order_item_history" do
      expect {
        delete :destroy, id: order_item_history.to_param, session: valid_session
      }.to change(OrderItemHistory, :count).by(-1)
    end

    it "redirects to the order_item_histories list" do
      delete :destroy, id: order_item_history.to_param, session: valid_session
      expect(response).to redirect_to(order_item_histories_url)
    end
  end

end
