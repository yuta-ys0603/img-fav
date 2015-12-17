# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    password { Faker::Internet.password }
    password_digest "password"
  end
end
