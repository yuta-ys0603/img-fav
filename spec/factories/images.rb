require "faker"
FactoryGirl.define do
  factory :image do
    title { Faker::Book.title }
    data  { File.open("spec/file/300.png") }
  end
end
