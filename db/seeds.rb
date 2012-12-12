# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development? && User.count == 0
	require 'faker'
	require 'factory_girl_rails'
	include FactoryGirl::Syntax::Methods

	puts 'Inserting sample users'

	20.times do
		user = create :user
		user.save!
		10.times do
			repo = create :repo, user: user, need_help: [true, false].sample, language: ['Ruby', 'Perl', 'C', 'PHP', 'Java', 'Ruby', 'JavaScript'].sample
		end
	end

end