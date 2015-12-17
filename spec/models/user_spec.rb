require 'spec_helper'
require 'rails_helper'

describe User do
  it 'does not allow empty name' do
    expect(FactoryGirl.build(:user, name: nil)).to have(1).errors_on(:name)
  end
  it 'will be unique name' do
    first_user = FactoryGirl.create(:user)
    expect(FactoryGirl.build(:user, name: first_user.name)).to have(1).errors_on(:name)
  end
  it 'does not allow empty password_digest' do
    expect(FactoryGirl.build(:user, password_digest: nil)).to have(1).errors_on(:password_digest)
  end
end
