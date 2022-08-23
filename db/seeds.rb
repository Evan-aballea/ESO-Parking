# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'
User.destroy_all

user1 = User.new(first_name: "oli", last_name: "bart", email: 'oli.bart@gmail.fr', phone_number: '0606066057', password:'PASSWORD1' )
user1.save!
user2 = User.new(first_name: "Eva", last_name: "al", email: 'eva.al@gmail.fr', phone_number: '0606456057', password:'PASSWORD2')
user2.save
user3 = User.new(first_name: "Sil", last_name: "Pasi", email: 'sil.pasi@gmail.fr', phone_number: '4546466057', password:'PASSWORD3')
user3.save

Parking.destroy_all

pkg1 = Parking.new(address: "4 rue pointue", height: '200', width: '300', length: '400', description: 'en bas au deuxieme sous-sol', user_id: user1.id, availability_date: Date.new(2022,2,3))
pkg1.save
pkg2 = Parking.new(address: "12 rue carré", height: '200', width: '300', length: '400', description: '4ème sous-sol', user_id: user1.id)
pkg2.save
pkg3 = Parking.new(address: "37 rue triangle", height: '200', width: '300', length: '400', description: 'extérieur', user_id: user2.id)
pkg3.save

Booking.destroy_all

book1 = Booking.new(user_id: user3.id, parking_id: pkg1.id, arrival:DateTime.new(2022,8,23,4,5,6))
book1.save
book2 = Booking.new(user_id: user3.id, parking_id: pkg3.id, arrival:DateTime.new(2022,9,23,4,5,6))
book2.save
book3 = Booking.new(user_id: user1.id, parking_id: pkg3.id, arrival:DateTime.new(2022,8,23,4,5,6))
book3.save
