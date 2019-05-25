# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

150.times do
	short_url = ShortUrl.new(:url => Faker::Internet.unique.url, :title => Faker::Internet.unique.domain_word, :visit_count => SecureRandom.random_number(100))
	short_url.save
end