require "faker"
FactoryGirl.define do
  factory :image do
    association :user, factory: :user
    title { Faker::Book.title }
    data  { fixture_file_upload("#{::Rails.root}/spec/fixtures/300.png", "image/png") }
  end
end
