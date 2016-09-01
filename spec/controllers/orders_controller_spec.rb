require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:order, customer_id: FactoryGirl.create(:customer).id) }
  
  let(:valid_session) { {} }

  let(:order) { FactoryGirl.create(:order) }

  describe "GET #index" do
    it "assigns all orders as @orders" do
      get :index, {}, session: valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      get :show, id: order.to_param, session: valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "GET #new" do
    it "assigns a new order as @order" do
      get :new, {}, session: valid_session
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe "GET #edit" do
    it "assigns the requested order as @order" do
      get :edit, id: order.to_param, session: valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, order: valid_attributes, session: valid_session
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, order: valid_attributes, session: valid_session
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      it "redirects to the created order" do
        post :create, order: valid_attributes, session: valid_session
        expect(response).to redirect_to(Order.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_customer) { FactoryGirl.create(:customer) }
      let(:new_attributes) {
        FactoryGirl.attributes_for(:order, customer_id: new_customer.id)
      }

      it "updates the requested order" do
        put :update, id: order.to_param, order: new_attributes, session: valid_session
        order.reload
        expect(order.customer_id).to eq(new_customer.id)
      end

      it "assigns the requested order as @order" do
        put :update, id: order.to_param, order: valid_attributes, session: valid_session
        expect(assigns(:order)).to eq(order)
      end

      it "redirects to the order" do
        put :update, id: order.to_param, order: valid_attributes, session: valid_session
        expect(response).to redirect_to(order)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:order) { FactoryGirl.create(:order) }
    it "destroys the requested order" do
      expect {
        delete :destroy, id: order.to_param, session: valid_session
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      delete :destroy, id: order.to_param, session: valid_session
      expect(response).to redirect_to(orders_url)
    end
  end

end
