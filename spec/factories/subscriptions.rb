FactoryGirl.define do
  factory :subscription do
    expired_at Time.zone.now + 7.days
  end

  trait :expired do
    expired_at Time.zone.now - 7.days
  end
end
