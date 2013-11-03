class Identity < ActiveRecord::Base
#  attr_accessor :password, :password_confirmation

  has_secure_password
end

