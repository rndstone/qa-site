require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid when name, email, password is given" do
    user = User.new(
      name: 'test',
      email: 'test@email.com',
      password: 'testpassword')
    expect(user).to be_valid
  end
  
  it "is invalid without name" do
      user = User.new(
      name: nil,
      email: 'test@email.com',
      password: 'testpassword')
      # expect(user).to be_valid
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
  end
  
  it "is invalid without email" do
      user = User.new(
      email: nil,
      password: 'testpassword')
      # expect(user).to be_valid
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
  end
  
  it "is invalid without password" do
      user = User.new(
      password: nil)
      # expect(user).to be_valid
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
  end
  
  it "is invalid with a duplicate name" do
      User.create(
      name: 'test',
      email: 'test@email.com',
      password: 'testpassword')
      
      user = User.new(
      name: 'test',
      email: 'test2@email.com',
      password: 'testpasswordy')
      
      user.valid?
      expect(user.errors[:name]).to include("has already been taken")
  end
  
  it "is invalid with a duplicate email" do
      User.create(
      name: 'test1',
      email: 'test@email.com',
      password: 'testpassword')
      
      user = User.new(
      name: 'test2',
      email: 'test@email.com',
      password: 'testpasswordy')
      
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
  end
  
  
end