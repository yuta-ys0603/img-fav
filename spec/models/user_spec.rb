require 'spec_helper'
require 'rails_helper'

describe User do
  it 'does not allow empty name' do
    user = FactoryGirl.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name].size).to eq 1
  end
  it 'will be unique name' do
    first_user = FactoryGirl.create(:user)
    second_user = FactoryGirl.build(:user, name: first_user.name)
    second_user.valid?
    expect(second_user.errors[:name].size).to eq 1
  end
  it 'does not allow empty password_digest' do
    user = FactoryGirl.build(:user, password_digest: nil)
    user.valid?
    expect(user.errors[:password_digest].size).to eq 1
  end
end
