# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.create(:language => 'Ruby')
Language.create(:language => 'Python')
Language.create(:language => 'JavaScript')
Language.create(:language => 'HTML/CSS')
Language.create(:language => 'PHP')


1000.times do
	zipcode = rand(10000..99999).to_s
	User.create(:zipcode => zipcode)
end