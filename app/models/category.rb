class Category < ActiveRecord::Base
  has_many :items
  attr_accessible :id, :name
end
