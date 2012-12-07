FactoryGirl.define do
  factory :repo do
  	association :user
    github_url "https://github.com/orendon/contrib-hub"
    sequence(:github_id) {|n| n }
    name { Faker::Lorem.word }
    need_help true
    user_description { Faker::Lorem.paragraph }
    language { Faker::Lorem.word }
  end
end