class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :color
  attr_accessible :category_id, :color_id, :explanation, :img, :name, :no, :price
end
