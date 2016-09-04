require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:order) { FactoryGirl.create(:order) }

  let(:valid_attributes) { FactoryGirl.attributes_for(:order_item) }

  let(:invalid_attributes) { FactoryGirl.attributes_for(:order_item, quantity: "invalid") }

  let(:valid_session) { {} }

  let(:order_item) { FactoryGirl.create(:order_item, order: order)}

  describe "GET #index" do
    it "assigns all order_items as @order_items" do
      get :index, order_id: order.id, session: valid_session
      expect(assigns(:order_items)).to eq([order_item])
    end
  end

  describe "GET #show" do
    it "assigns the requested order_item as @order_item" do
      get :show, order_id: order.id, id: order_item.to_param, session: valid_session
      expect(assigns(:order_item)).to eq(order_item)
    end
  end

  describe "GET #new" do
    it "assigns a new order_item as @order_item" do
      get :new, order_id: order.id, session: valid_session
      expect(assigns(:order_item)).to be_a_new(OrderItem)
    end
  end

  describe "GET #edit" do
    it "assigns the requested order_item as @order_item" do
      get :edit, order_id: order.id, id: order_item.to_param, session: valid_session
      expect(assigns(:order_item)).to eq(order_item)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new OrderItem" do
        expect {
          post :create, order_id: order.id, order_item: valid_attributes, session: valid_session
        }.to change(OrderItem, :count).by(1)
      end

      it "assigns a newly created order_item as @order_item" do
        post :create, order_id: order.id, order_item: valid_attributes, session: valid_session
        expect(assigns(:order_item)).to be_a(OrderItem)
        expect(assigns(:order_item)).to be_persisted
      end

      it "redirects to the created order_item" do
        post :create, order_id: order.id, order_item: valid_attributes, session: valid_session
        expect(response).to redirect_to(order)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved order_item as @order_item" do
        post :create, order_id: order.id, order_item: invalid_attributes, session: valid_session
        expect(assigns(:order_item)).to be_a_new(OrderItem)
      end

      it "re-renders the 'new' template" do
        post :create, order_id: order.id, order_item: invalid_attributes, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { 
        FactoryGirl.attributes_for(:order_item, quantity: 42) 
      }

      it "updates the requested order_item" do
        put :update, order_id: order.id, id: order_item.to_param, order_item: new_attributes, session: valid_session
        order_item.reload
        expect(order_item.quantity).to eq(new_attributes[:quantity])
      end

      it "assigns the requested order_item as @order_item" do
        put :update, order_id: order.id, id: order_item.to_param, order_item: valid_attributes, session: valid_session
        expect(assigns(:order_item)).to eq(order_item)
      end

      it "redirects to the order_item" do
        put :update, order_id: order.id, id: order_item.to_param, order_item: valid_attributes, session: valid_session
        expect(response).to redirect_to(order)
      end
    end

    context "with invalid params" do
      it "assigns the order_item as @order_item" do
        put :update, order_id: order.id, id: order_item.to_param, order_item: invalid_attributes, session: valid_session
        expect(assigns(:order_item)).to eq(order_item)
      end

      it "re-renders the 'edit' template" do
        put :update, order_id: order.id, id: order_item.to_param, order_item: invalid_attributes, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:order_item) { FactoryGirl.create(:order_item)}
    it "destroys the requested order_item" do
      expect {
        delete :destroy, order_id: order_item.order_id, id: order_item.to_param, session: valid_session
      }.to change(OrderItem, :count).by(-1)  
    end

    it "redirects to the order_items list" do
      delete :destroy, order_id: order_item.order_id, id: order_item.to_param, session: valid_session
      expect(response).to redirect_to(order_item.order)
    end
  end

end
