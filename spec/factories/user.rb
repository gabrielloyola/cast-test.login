require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.username }
    password { Faker::Barcode.ean }
  end
end
