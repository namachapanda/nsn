class Item < ActiveRecord::Base
  attr_accessible :category_id, :color_id, :explain, :img, :name, :no, :price
end
