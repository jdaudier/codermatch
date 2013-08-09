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


# 5.times do
# 	zipcode = rand(78700..78799).to_s
# 	name = rand(1..5).to_s
# 	login = rand(1..5).to_s
# 	User.create(:zipcode => zipcode, :name => name, :login => login, :level => 'Beginner', :language_id => 1)
# end