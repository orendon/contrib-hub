FactoryGirl.define do
  factory :repo do
    association :user
    github_url { Faker::Internet.url }
    sequence(:github_id) {|n| n }
    name { Faker::Lorem.word }
    need_help { [true, false].sample }
    description { Faker::Lorem.paragraph }
    user_description { Faker::Lorem.paragraph }
    language { ['Ruby', 'Perl', 'C', 'PHP', 'Java', 'Ruby', 'JavaScript'].sample }
  end
end
