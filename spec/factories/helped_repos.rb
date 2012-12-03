FactoryGirl.define do
  factory :helped_repo do
  	association :user
  	association :repo
  	really_helping false
  end
end