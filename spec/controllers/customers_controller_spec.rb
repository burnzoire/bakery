require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  let(:valid_session) { {} }

  let(:valid_attributes) { FactoryGirl.attributes_for(:customer) }

  let(:customer) { FactoryGirl.create(:customer) }

  describe "GET #index" do
    it "assigns all customers as @customers" do
      get :index, params: {}, session: valid_session
      expect(assigns(:customers).count).to eq(Customer.count)
    end
  end

  describe "GET #show" do
    it "assigns the requested customer as @customer" do
      get :show, id: customer.to_param, session: valid_session
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe "GET #new" do
    it "assigns a new customer as @customer" do
      get :new, {}, session: valid_session
      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end

  describe "GET #edit" do
    it "assigns the requested customer as @customer" do
      get :edit, id: customer.to_param, session: valid_session
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Customer" do
        expect {
          post :create, customer: valid_attributes, session: valid_session
        }.to change(Customer, :count).by(1)
      end

      it "assigns a newly created customer as @customer" do
        post :create, customer: valid_attributes, session: valid_session
        expect(assigns(:customer)).to be_a(Customer)
        expect(assigns(:customer)).to be_persisted
      end

      it "redirects to the created customer" do
        post :create, customer: valid_attributes, session: valid_session
        expect(response).to redirect_to(Customer.last)
      end
    end

  end

  describe "DELETE #destroy" do
    let!(:customer) { FactoryGirl.create(:customer) }
    it "destroys the requested customer" do
      expect {
        delete :destroy, id: customer.to_param, session: valid_session
      }.to change(Customer, :count).by(-1)
    end

    it "redirects to the customers list" do
      delete :destroy, id: customer.to_param, session: valid_session
      expect(response).to redirect_to(customers_url)
    end
  end

end
