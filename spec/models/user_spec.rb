require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  
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
  
  it "is invalid with a password which length is less than 8" do
      user = User.new(
      name: 'test2',
      email: 'test@email.com',
      password: 'testpa')
      
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 8 characters)')
  end
  
    it "is invalid with a password which length is more than 128" do
      user = User.new(
      name: 'test2',
      email: 'test@email.com',
      password: 'jXU3hKdxWUZR4D7pWcDi_aLdRC9TJUtPuKUifBDE3aWJ_KF7yM8gnShEJrm53Ky8iGZ3EiXQKeMW6rkyNeSJG5uJQGABhRkTVXFw
      wc2BKyR2TpYSSfs4RiGkYHGFTttsXkUzwwyStNx7gHCFE2N7Vz683HjBC6_zNwNyXPHGDnntuseueFQKCa6uSVtaFRm96JVD8kfV
      4s_pAVfbw5fSSERUTYHmf9RuNB2YPDS9yC8cf55W53PKswWNK7UpX7r2RbnWs7Tx5Gkid2AUmGwzKH2kErrnKtMeiJTmjftWSSFC
      NhNHmDAhnDM_RdtbPb7K36d3eK65SZYT85pHZZpTkdTLMf9S3jhPFN7KyChCaeMuPQ8HhhWAJY7TdYMi4VhwEMJ2i26FMRM79kkQ
      FmfNQSpNsRMDiSCe8zSdbRd_bhHFm6CDrTDXgcscYFNuAZ3KUhDk_DwgDGmx2z2hx4BXiENguRrjabQFzizaZMKhSeNF7zKnLWJx
      VjPx7t7dpmbjwryY7RCD8XxN4tzShuCazUHxj6pPU222rpbP5dKAAzxQM5RBagsTKkjm8XNVLTfP4QnE3L5hQMeNcF
      MWASa4DQeYBtdgF3yu9U57uU9syCNWj4uQhmVBtNi2ZGzctAmxDTux8kMfZ8')
      
      user.valid?
      expect(user.errors[:password]).to include('is too long (maximum is 128 characters)')
  end
end