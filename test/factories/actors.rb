FactoryGirl.define do
  factory :actor do
    sequence(:first_name) { |n| "Test#{n}" }
    sequence(:last_name) { |n| "User#{n}" }
    birthday { 20.years.ago }
  end
end
