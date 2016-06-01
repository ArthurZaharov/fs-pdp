FactoryGirl.define do
  factory :article do
    title
    content
    user
    kind "free"
  end

  trait :paid do
    kind "paid"
  end
end
