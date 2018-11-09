require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(user) { User.create!(email: "example@example.com", password: "1234567") }
  let(:my_item) { Item.create!(name:"New Item Name", user: user) }

  describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns [my_item] to @items" do
        get :index
        expect(assigns(:items)).to eq([my_item])
      end
    end


  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @item" do
      get :new
      expect(assigns(:item)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Item by 1" do
      expect{ post :create, params: { item: { name:"New Item"} } }.to change(Item,:count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, params: { item: { name:"New Item"}}
      expect(assigns(:item)).to eq Item.last
    end

    it "redirect to the new item" do
      post :create, params: { item: { name:"New Item"}}
      expect(response).to redirect_to Item.last
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { id: my_item.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: my_item.id }
      expect(response).to render_template :show
    end

   it "assigns my_item to @item" do
     get :show, params: { id: my_item.id }
     expect(assigns(:item)).to eq(my_item)
   end
   end

describe "DELETE destroy" do
  it "deletes the item" do
    delete :destroy, params: { id: my_item.id }
    count = Item.where({id: my_item.id}).size
    expect(count).to eq 0
  end

  it "redirects to items index" do
    delete :destroy, params: { id: my_item.id }
    expect(response).to redirect_to current_user
  end
end
end
