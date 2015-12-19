require 'rails_helper'

describe Favorite, type: :model do
  it "does not allow empty image" do
    favorite = FactoryGirl.build(:favorite, image_id: nil)
    favorite.valid?
    expect(favorite.errors[:image_id].size).to eq 1
  end
  it "does not allow empty user" do
    favorite = FactoryGirl.build(:favorite, user_id: nil)
    favorite.valid?
    expect(favorite.errors[:user_id].size).to eq 1
  end
end
