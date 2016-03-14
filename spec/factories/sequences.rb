FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { Faker::Lorem.sentence }
  sequence(:content) { Faker::Lorem.paragraph }
end
