require 'spec_helper'

describe Identity do
  it "has a username" do
    Identity.new.should respond_to(:username) 
  end

  it "has a password_digest" do
    Identity.new.should respond_to(:password_digest) 
  end

  it "has a first_name" do
    Identity.new.should respond_to(:first_name) 
  end

  it "has a middle_name" do
    Identity.new.should respond_to(:middle_name) 
  end

  it "has a last_name" do
    Identity.new.should respond_to(:last_name) 
  end
  
  it "has a gender" do
    Identity.new.should respond_to(:gender) 
  end
  
  it "has a email" do
    Identity.new.should respond_to(:email) 
  end
  
  it "can be an admin" do
    Identity.new.should respond_to(:admin) 
  end

  describe 'passwords' do
    it "accepts a password and creates a password_digest" do
      user = Identity.new(password: 'password', password_confirmation: 'password')
      user.save
      user.password_digest.should_not be_blank
    end
  end
end

