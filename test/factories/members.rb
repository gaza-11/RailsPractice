FactoryGirl.define do
  factory :member do
    sequence(:name) { |n| "TestUser#{n}" }
    admin_flag { false }
  end
end
