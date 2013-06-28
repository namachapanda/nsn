#encoding: utf-8

class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :color
  attr_accessible :category_id, :color_id, :explanation, :img, :name, :no, :price

  validates :no,
  	:presence => { :message => 'は必ず入力してください' },
  	:uniqueness => { :message => 'が重複しています' },
  	:length => { :minimum => 4, :maximum => 6, :message => 'は4〜6文字で入力してください' },
  	:numericality => { :only_integer => true, :message => 'は数字で入力してください'  }

  validates :name,
  	:presence => { :message => 'は必ず入力してください' },
  	:uniqueness => { :message => 'が重複しています' },
  	:length => { :maximum => 20, :message => 'は20字以内で入力してください' }

  validates :price,
  	:presence => { :message => 'は必ず入力してください' },
  	:numericality => { :only_integer => true, :less_than => 100000, :message => 'は5桁以内の数字で入力してください' }

  validates :category_id,
  	:presence => { :message => 'は必ず入力してください' }

  validates :color_id,
  	:presence => { :message => 'は必ず入力してください' }

  validates :img,
  	:presence => { :message => 'は必ず入力してください' },
  	:uniqueness => { :message => 'が重複しています' },
  	:format => { :with => /^\d{4}\.jpg$/, :message => 'は[商品番号.jpg]形式で入力してください'  }

  validates :explanation,
  	:presence => { :message => 'は必ず入力してください' },
  	:length => { :maximum => 150, :message => 'は150字以内で入力してください' }


    
  
  scope :search, lambda{ |freeword, category_id, color_id, price1, price2|

    params_category = params_color = Hash.new
    low_price = 0
    high_price = 2147483647

      if "#{category_id}"
        params_category[:category_id] = "#{category_id}"
      end

      if "#{color_id}"
        params_color[:color_id] = "#{color_id}"
      end

      unless "#{price1}".blank?
        low_price = "#{price1}"
      end

      unless "#{price2}".blank?
        high_price = "#{price2}"
      end

    @freeword = '(name like ?) OR (explanation like ?)',"%#{freeword}%","%#{freeword}%"

     where( @freeword )
    .where( "category_id = ?", "#{category_id}" )
    .where( "color_id = ?", "#{color_id}" )
    .where( 'price >= ?',low_price )
    .where( 'price <= ?',high_price )
  }

end
