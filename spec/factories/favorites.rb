require "faker"
FactoryGirl.define do
  factory :favorite do
    association :user, factory: :user
    association :image, factory: :image
  end
end
