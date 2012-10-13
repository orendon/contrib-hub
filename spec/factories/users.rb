FactoryGirl.define do
  factory :user do
    sequence(:github_id){|n| "username_#{n}"}
    name "the user name"
    sequence(:token){|n| "123456#{n}"}
  end
end