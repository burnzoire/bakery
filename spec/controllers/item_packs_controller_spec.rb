require 'rails_helper'

RSpec.describe ItemPacksController, type: :controller do
  let(:item) { FactoryGirl.create(:item) }

  let(:valid_attributes) { FactoryGirl.attributes_for(:item_pack) }

  let(:invalid_attributes) { FactoryGirl.attributes_for(:item_pack, price: "free") }

  let(:valid_session) { {} }

  let(:item_pack) { FactoryGirl.create(:item_pack)}

  describe "GET #index" do
    it "assigns all item_packs as @item_packs" do
      get :index, item_id: item.id, session: valid_session
      expect(assigns(:item_packs)).to eq([item_pack])
    end
  end

  describe "GET #show" do
    it "assigns the requested item_pack as @item_pack" do
      get :show, item_id: item.id, id: item_pack.to_param, session: valid_session
      expect(assigns(:item_pack)).to eq(item_pack)
    end
  end

  describe "GET #new" do
    it "assigns a new item_pack as @item_pack" do
      get :new, item_id: item.id, session: valid_session
      expect(assigns(:item_pack)).to be_a_new(ItemPack)
    end
  end

  describe "GET #edit" do
    it "assigns the requested item_pack as @item_pack" do
      get :edit, item_id: item.id, id: item_pack.to_param, session: valid_session
      expect(assigns(:item_pack)).to eq(item_pack)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ItemPack" do
        expect {
          post :create, item_id: item.id, item_pack: valid_attributes, session: valid_session
        }.to change(ItemPack, :count).by(1)
      end

      it "assigns a newly created item_pack as @item_pack" do
        post :create, item_id: item.id, item_pack: valid_attributes, session: valid_session
        expect(assigns(:item_pack)).to be_a(ItemPack)
        expect(assigns(:item_pack)).to be_persisted
      end

      it "redirects to the created item_pack" do
        post :create, item_id: item.id, item_pack: valid_attributes, session: valid_session
        expect(response).to redirect_to(ItemPack.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved item_pack as @item_pack" do
        post :create, item_id: item.id, item_pack: invalid_attributes, session: valid_session
        expect(assigns(:item_pack)).to be_a_new(ItemPack)
      end

      it "re-renders the 'new' template" do
        post :create, item_id: item.id, item_pack: invalid_attributes, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:item_pack, price: 3.5)
      }

      it "updates the requested item_pack" do
        put :update, item_id: item.id, id: item_pack.to_param, item_pack: new_attributes, session: valid_session
        item_pack.reload
        expect(item_pack.price).to eq(new_attributes[:price])
      end

      it "assigns the requested item_pack as @item_pack" do
        put :update, item_id: item.id, id: item_pack.to_param, item_pack: valid_attributes, session: valid_session
        expect(assigns(:item_pack)).to eq(item_pack)
      end

      it "redirects to the item_pack" do
        put :update, item_id: item.id, id: item_pack.to_param, item_pack: valid_attributes, session: valid_session
        expect(response).to redirect_to(item_pack)
      end
    end

    context "with invalid params" do
      it "assigns the item_pack as @item_pack" do
        put :update, item_id: item.id, id: item_pack.to_param, item_pack: invalid_attributes, session: valid_session
        expect(assigns(:item_pack)).to eq(item_pack)
      end

      it "re-renders the 'edit' template" do
        put :update, item_id: item.id, id: item_pack.to_param, item_pack: invalid_attributes, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:item_pack) { FactoryGirl.create(:item_pack)}
    it "destroys the requested item_pack" do
      expect {
        delete :destroy, item_id: item.id, id: item_pack.to_param, session: valid_session
      }.to change(ItemPack, :count).by(-1)
    end

    it "redirects to the item_packs list" do
      delete :destroy, item_id: item.id, id: item_pack.to_param, session: valid_session
      expect(response).to redirect_to(item_item_packs_url(item_id: item.id))
    end
  end

end
