FactoryGirl.define do
  factory :user do
    sequence(:github_id) {|n| "#{Faker::Lorem.word}#{n}" }
    name { Faker::Name.name }
    sequence(:token) {|n| "123456#{n}"}
    location { Faker::Address.city }
    sequence(:latitude) {|n| n + 6.22964}
    sequence(:longitude) {|n| n + -75.587482}
  end
end