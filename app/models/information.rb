#encoding: utf-8

class Information < ActiveRecord::Base
  attr_accessible :info, :renew

  validates :info,
  	:presence => { :message => 'は必ず入力してください' },
  	:length => { :maximum => 50, :message => 'は50文字以内で入力してください' }
end
