class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
         # :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :login_code, :password, :password_confirmation

  # def email_required?
  # false
  # end
end
