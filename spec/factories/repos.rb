FactoryGirl.define do
  factory :repo do
  	association :user
    github_url "https://github.com/orendon/contrib-hub"
    name { Faker::Name.first_name }
    need_help true
    user_description { Faker::Lorem.paragraph }
  end
end