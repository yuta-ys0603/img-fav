require 'rails_helper'

describe Image, type: :model do
  it "does not allow empty title" do
    favorite = FactoryGirl.build(:image, title: nil)
    favorite.valid?
    expect(favorite.errors[:title].size).to eq 1
  end
  it "does not allow empty data" do
    favorite = FactoryGirl.build(:image, data: nil)
    favorite.valid?
    expect(favorite.errors[:data].size).to eq 1
  end
end
