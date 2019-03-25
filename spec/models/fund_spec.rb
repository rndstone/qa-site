require 'rails_helper'

RSpec.describe Fund, type: :model do
  let!(:user){FactoryBot.create(:user)}
  let!(:curtype){FactoryBot.create(:currency_type)}
  it "ユーザー登録した時にポイント付与" do
    User.transaction do
      new_user = User.new(id:2, name: 'test2',email: 'newuser@email.com',
      password: 'newpassword')
      new_user.save!
      fund = new_user.funds.build(amount:350, currency_type:1)
      fund.save!
      expect(fund.amount).to eq 350
    end
  end
  
  it "ログインした時ポイント付与" do
    fund = user.funds.build(id:1, amount:350, currency_type:1)
    fund.save
    expect{
      user.apply_login_bornus
    }.to change {user.funds.find_by(currency_type:1).amount}.by(30)
    p Transfer.joins(:transfer_tos).where(transfer_tos: {to_user: 1})
    expect(Transfer.joins(:transfer_tos).where(transfer_tos: {to_user: 1})[0].amount).to eq 30
    # expect(user.authenticate(user.password)).to change {fund.amount}.by(30)
  end
end
