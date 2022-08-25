# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require 'date'
Booking.destroy_all
Parking.destroy_all
User.destroy_all

file = URI.open("https://st.depositphotos.com/1269204/1219/i/450/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg")
user1 = User.new(first_name: "oli", last_name: "bart", email: 'oli.bart@gmail.fr', phone_number: '0606066057', password:'PASSWORD1' )
user1.photo.attach(io: file, filename: "profil1.png", content_type: "image/png")
user1.save!

file2 = URI.open("https://laviedesreines.com/wp-content/uploads/2022/02/Comment-devenir-une-personne-solaire-pour-obtenir-tout-ce-que-vous-voulez-720x540.jpg")
user2 = User.new(first_name: "Eva", last_name: "al", email: 'eva.al@gmail.fr', phone_number: '0606456057', password:'PASSWORD2')
user2.photo.attach(io: file2, filename: "profil2.png", content_type: "image/png")
user2.save

file3 = URI.open("https://www.soladis.com/wp-content/uploads/2017/06/personne-1-1.png")
user3 = User.new(first_name: "Sil", last_name: "Pasi", email: 'sil.pasi@gmail.fr', phone_number: '4546466057', password:'PASSWORD3')
user3.photo.attach(io: file3, filename: "profil3.png", content_type: "image/png")
user3.save



file1a = URI.open("https://www.demainlaville.com/content/uploads/2017/02/entrepot-range-garage-1280x720.png")
pkg1 = Parking.new(address: "4 rue pointue", height: '200', width: '300', length: '400', description: 'en bas au deuxieme sous-sol', user_id: user1.id, start_date: "2022-5-4", end_date: "2022-10-12")
pkg1.photos.attach(io: file1a, filename: "garage1a.png", content_type: "image/png")
file1b = URI.open("https://www.demainlaville.com/content/uploads/2017/02/entrepot-range-garage-1280x720.png")
pkg1.photos.attach(io: file1b, filename: "garage1b.png", content_type: "image/png")
pkg1.save

file2a = URI.open("https://www.ootravaux.fr/sites/ootravaux/files/2021-06/Ootravaux-prix-garage-enterre.jpg")
pkg2 = Parking.new(address: "12 rue carré", height: '200', width: '300', length: '400', description: '4ème sous-sol', user_id: user1.id, start_date: "2022-5-4", end_date: "2022-10-12")
pkg1.photos.attach(io: file2a, filename: "garage2a.png", content_type: "image/png")
file2b = URI.open("https://www.ootravaux.fr/sites/ootravaux/files/2021-06/Ootravaux-prix-garage-enterre.jpg")
pkg2.photos.attach(io: file2b, filename: "garage2b.png", content_type: "image/png")
pkg2.save

file3a = URI.open("https://previews.123rf.com/images/warrengoldswain/warrengoldswain1610/warrengoldswain161000107/65425617-heureux-sourire-africain-homme-noir-portrait-de-personne-r%C3%A9elle-en-studio-collection-compl%C3%A8te-de-div.jpg")
pkg3 = Parking.new(address: "37 rue triangle", height: '200', width: '300', length: '400', description: 'extérieur', user_id: user2.id, start_date: "2022-5-4", end_date: "2022-10-12")
pkg1.photos.attach(io: file3a, filename: "garage3a.png", content_type: "image/png")
file3b = URI.open("https://previews.123rf.com/images/warrengoldswain/warrengoldswain1610/warrengoldswain161000107/65425617-heureux-sourire-africain-homme-noir-portrait-de-personne-r%C3%A9elle-en-studio-collection-compl%C3%A8te-de-div.jpg")
pkg3.photos.attach(io: file3b, filename: "garage3b.png", content_type: "image/png")
pkg3.save




book1 = Booking.new(user_id: user3.id, parking_id: pkg1.id, booking_start: DateTime.new(2022,8,23,4,5,6), booking_end: DateTime.new(2022,8,23,4,5,6))
book1.save
book2 = Booking.new(user_id: user3.id, parking_id: pkg3.id, booking_start: DateTime.new(2022,9,23,4,5,6), booking_end: DateTime.new(2022,8,23,4,5,6))
book2.save
book3 = Booking.new(user_id: user1.id, parking_id: pkg3.id, booking_start: DateTime.new(2022,8,23,4,5,6), booking_end: DateTime.new(2022,8,23,4,5,6))
book3.save
