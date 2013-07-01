#encoding: utf-8
require 'spec_helper'

describe Item do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe '管理側 商品更新' do
  	describe 'バリデーションテスト' do
  	  before do 
  	  	@item = FactoryGirl.create :item
  	  end

  	  context '商品番号が空の場合' do
  	  	it 'validでないこと' do 
  	  	  @item.no = ''
  	  	  @item.should_not be_valid
  	  	end
  	  end

  	  context '商品番号が既に存在する場合' do
  	  	it 'validでないこと' do 
  	  	  item
  	  	end
  	  end

  	  context '商品番号が最小長未満の場合' do
  	  	it 'validでないこと' do 
  	  	  @item.no = 123
		  @item.should_not be_valid
  	  	end
  	  end

  	  context '商品番号が最大長を超える場合' do
  	  	it 'validでないこと' do 
  	  	  # @item.no.should have <= 6
  	  	  # @item.no.should have_at_most(6)
  	  	  @item.no = 1234567
		  @item.should_not be_valid
  	  	end
  	  end

  	  context '商品番号が数字でない場合' do
  	  	it 'validでないこと' do 
  	  	  @item.no = '１２３４５'
		  @item.should_not be_valid
  	  	end
  	  end

  	  context '商品番号がチェック条件を満たしている場合' do
  	  	it 'validであること' do 
  	  	  item = FactoryGirl.build :item_valid
  	  	  item.should be_valid
  	  	end
  	  end

  	  context '商品名が空の場合' do
  	  	it 'validでないこと' do 
  	  	  @item.name = ''
  	  	  @item.should_not be_valid
  	  	end

  	 # 	  it ":name にエラーが設定されていること" do
     #      @item.should have(1).errors_on(:name)
  	 #    end
  	  end

  	  context '商品名が既に存在する場合' do
  	  	it 'validでないこと' do 
  	  	  item
  	  	end
  	  end

  	  context '商品名が最大長を超える場合' do
  	  	it 'validでないこと' do 
  	  	  @item.name = 'あ' * 21
		  @item.should_not be_valid
  	  	end
  	  end

  	  context '商品名がチェック条件を満たしている場合' do
  	  	it 'validであること' do 
  	  	  item = FactoryGirl.build :item_valid
  	  	  item.should be_valid
  	  	end
  	  end

  	  context '単価が空の場合' do
  	  	it 'validでないこと' do 
  	  	  @item.price = ''
  	  	  @item.should_not be_valid
  	  	end
  	  end

  	  context '単価が最大桁数を超える場合' do
  	  	it 'validでないこと' do 
  	  	  @item.price = 123456
		  @item.should_not be_valid
  	  	end
  	  end

  	  context '単価がチェック条件を満たしている場合' do
  	  	it 'validであること' do 
  	  	  item = FactoryGirl.build :item_valid
  	  	  item.should be_valid
  	  	end
  	  end

  	  context 'カテゴリーIDが空の場合' do
  	  	it 'validでないこと' do 
  	  	  @item.category_id = ''
  	  	  @item.should_not be_valid
  	  	end
  	  end

  	  context 'カテゴリーIDがチェック条件を満たしている場合' do
  	  	it 'validであること' do 
  	  	  @item.category_id = 1
		  @item.should be_valid
  	  	end
  	  end

  	  context 'カラーIDが空の場合' do
  	  	it 'validでないこと' do 
  	  	  @item.color_id = ''
  	  	  @item.should_not be_valid
  	  	end
  	  end

  	  context 'カラーIDがチェック条件を満たしている場合' do
  	  	it 'validであること' do 
  	  	  item = FactoryGirl.build :item_valid
  	  	  item.should be_valid
  	  	end
  	  end

  	  context '商品画像が空の場合' do
  	  	it 'validでないこと' do 
  	  	  @item.img = ''
  	  	  @item.should_not be_valid
  	  	end
  	  end

  	  context '商品画像が既に存在する場合' do
  	  	it 'validでないこと' do 
  	  	  item
  	  	end
  	  end

  	  context '商品画像が形式に一致しない場合' do
  	  	it 'validでないこと' do 
  	  	  item
  	  	end
  	  end

  	  context '商品画像がチェック条件を満たしている場合' do
  	  	it 'validであること' do 
  	  	  item = FactoryGirl.build :item_valid
  	  	  item.should be_valid
  	  	end
  	  end

  	  context '商品説明文が空の場合' do
  	  	it 'validでないこと' do 
  	  	  @item.explanation = ''
  	  	  @item.should_not be_valid
  	  	end
  	  end

  	  context '商品説明文が最大長を超える場合' do
  	  	it 'validでないこと' do 
  	  	  @item.explanation = 'あ' * 151
		  @item.should_not be_valid
  	  	end
  	  end

  	  context '商品説明文がチェック条件を満たしている場合' do
  	  	it 'validであること' do 
  	  	  item = FactoryGirl.build :item_valid
  	  	  item.should be_valid
  	  	end
  	  end
    end
  end

  describe 'ユーザー側 商品検索' do
  	describe 'scopeの挙動' do
  	  before do 
  	  	item = FactoryGirl.create_list :item_search_many, 6
  	  end

  	  subject {Item.search(params)}

  	  context 'フリーワード検索を行った場合' do 
  	  	it '商品名に一致した商品を取得する' do 
  	  		item
  	  	end

  	  	it '説明文に一致した商品を取得する' do 
  	  		item
  	  	end
  	  end

  	  context 'カテゴリー検索を行った場合' do
  	  	let(:params) { {category_id: 1} }
  	  	it 'カテゴリーに一致した商品を取得する' do
  	  	  subject.all?{|i| i.category_id == 1}.should be_true
  	  	end
  	  end

  	  context 'カラー検索を行った場合' do
  	  	let(:params) { {color_id: 2}}
   	  	it 'カラーに一致した商品を取得する' do 
  	  	  subject.all?{|i| i.color_id == 2}.should be_true
  	  	end
  	  end

  	  context '値段検索を行った場合' do
  	  	it '〜円以上の条件に一致した商品を取得する' do 
  	  	  item
  	  	end

  	  	it '〜円以下の条件に一致した商品を取得する' do 
  	  	  item
  	  	end
  	  end
    end
  end
end
