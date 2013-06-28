# coding: utf-8

require 'spec_helper'

describe Manage::ItemsController do

  # This should return the minimal set of attributes required to create a valid
  # Manage::Item. As you add validations to Manage::Item, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "no" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Manage::ItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:all) do
    @item = FactoryGirl.create(:item)
  end

  describe "GET index" do
    # let(:item) { FactoryGirl.create(:item) }

    before do
      get :index
    end
    it 'アクセスできること' do
      response.should be_success
    end
    it 'データが１件取得できること' do
      assigns(:items).should have(1).item
    end
    it 'データが全件取得できること' do
      assigns(:items).should eq(Item.all)
    end
  end

  describe "GET show" do

    before do
      get :show, { :id => Item.first.id }
    end
    it 'アクセスできること' do
      response.should be_success
    end
    it '対象商品の詳細情報を取得できること' do
      assigns(:item).should eq(Item.first)
    end
  end

  describe "GET new" do

    before do
      get :new
    end
    it 'アクセスできること' do
      response.should be_success
    end
    it '商品追加フォームを取得できること' do
      assigns(:item).should be_a_new(Item)
    end
  end

  describe "GET edit" do

    before do
      get :edit, { :id => Item.first.id }
    end
    it 'アクセスできること' do
      response.should be_success
    end
    it '対象商品の詳細情報を取得できること' do
      assigns(:item).should eq(Item.first)
    end
  end

  describe "POST create" do
    context "正常な入力であった場合 " do # パラメータが有効な場合

      let(:valid_attributes) {
        {:item => {
          :no => "9999",
          :name => "test",
          :price => "9",
          :category_id => "1",
          :color_id => "1",
          :img => "9999.jpg",
          :explanation => "test"
         }}
      }

      it '新しい商品情報を作成できること' do # DBに新しい商品情報を追加すること
        expect {
          post :create, valid_attributes
        }.to change(Item, :count).by(1)
        # #追加前
        # before_create_item_count = Item.count

        # #追加
        # post :create, valid_attributes

        #  #追加後
        #  Item.count.should eq (before_create_item_count + 1)
        # assigns(:item).should change(Item, :count).by(1)
      end
      it '新しい商品情報のオブジェクトを作成すること' do # DBに新しい商品情報があるかを確認すること
        post :create, valid_attributes
        assigns(:item).should be_a(Item)
        assigns(:item).should be_persisted # 保存されていること
      end
      it '新しい商品情報をindexに転送すること' do
        post :create, valid_attributes
        response.should redirect_to(manage_items_path)
      end
    end

    context "不正な入力であった場合" do # パラメータが無効な場合

      before do
        post :create, :item => {
          :no => "",
          :name => "test",
          :price => "9",
          :category_id => "1",
          :color_id => "1",
          :img => "9999.jpg",
          :explanation => "test"
         }
      end
      it '新しい商品情報が保存されていないこと' do # DBに保存されていない@itemを新しく作る
        assigns(:item).should be_a_new(Item) # まだ保存されいていない
      end
      it '商品情報を追加するページを出力すること' do
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    context  "パラメータが有効な場合" do

      before do
      end

      let(:valid_attributes) {
        {
          :no => "9999",
          :name => "YourString",
          :price => "9",
          :category_id => "1",
          :color_id => "1",
          :img => "9999.jpg",
          :explanation => "test"
         }
      }

      it 'リクエストされた商品情報を更新できること' do # DBに更新された商品情報があるかを確認すること
        expect {
          put :update, { :id => Item.first.to_param, :item => valid_attributes }
        }.to change{Item.first.name}.from("MyString").to("YourString")
      end
      it '更新された商品情報をindexに転送すること' do
        put :update, { :id => Item.first.to_param, :item => valid_attributes }
        response.should redirect_to(manage_items_path)
      end
      it 'urlがmanage_item_pathであること' do
        put :update, { :id => Item.first.to_param, :item => valid_attributes }
        assigns(:url).should eq(manage_item_path)
      end
    end

    context "パラメータが無効な場合" do
  #     it "assigns the manage_item as @manage_item" do
  #       item = Manage::Item.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Manage::Item.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => item.to_param, :manage_item => { "no" => "invalid value" }}, valid_session
  #       assigns(:manage_item).should eq(item)
  #     end

  #     it "re-renders the 'edit' template" do
  #       item = Manage::Item.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Manage::Item.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => item.to_param, :manage_item => { "no" => "invalid value" }}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
      let(:valid_attributes) {
        {
          :no => "",
          :name => "YourString",
          :price => "9",
          :category_id => "1",
          :color_id => "1",
          :img => "9999.jpg",
          :explanation => "test"
         }
      }

      before do
      end
      it '更新ができていないこと' do # 不正な入力のときでも、@itemが作られる
        expect {
          put :update, { :id => Item.first.to_param, :item => valid_attributes }
        }.to_not change{Item.first.name}
      end
      it '商品情報を編集するページを出力すること' do
        put :update, { :id => Item.first.to_param, :item => valid_attributes }
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do

    it 'リクエストされた商品情報を削除すること' do
      expect {
        delete :destroy, { :id => Item.first.id }
      }.to change(Item, :count).by(-1)
    end
    it '削除された商品情報をindexに転送すること' do
      delete :destroy, { :id => Item.first.id }
      response.should redirect_to(manage_items_url)
    end
  end
end

