FactoryGirl.define do
  factory :user do
    sequence(:github_id) {|n| n }
    name "John Doe"
    sequence(:token) {|n| "123456#{n}"}
    location "City"
    sequence(:latitude) {|n| n + 6.22964}
    sequence(:longitude) {|n| n + -75.587482}
  end
end