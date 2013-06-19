class Color < ActiveRecord::Base
  has_many :items
  attr_accessible :id, :name
end
