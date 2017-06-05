namespace :db do
  desc "Erase and fill the database"
  task :populate => :environment do
    require 'faker'

    puts "Deleting existing records"
    [Staff, Sale, Transaction, Product, Order].each(&:delete_all)

    puts "Generating data"

    100.times do
      staff = Staff.create!(position: Faker::Company.profession, name: Faker::Name.first_name)
      sale = Sale.create!(price: Faker::Commerce.price, staff: staff)
      tr = Transaction.create!(sale: sale)
      cd = MusicCd.create!(name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300), artist: Faker::Book.title, genre: Faker::Book.genre)
      video = VideoGame.create!(name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300), genre: Faker::Book.genre, age_requirements: Faker::Number.between(3, 18))
      hardware = Hardware.create!(name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300), warranty: Faker::Number.between(4, 24), purpose: Faker::Company.catch_phrase)
      movie = Movie.create!(name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300), director: Faker::Name.name, genre: Faker::Book.genre, age_requirements: Faker::Number.between(3, 18))
      order1 = Order.create!(customer_contact: Faker::PhoneNumber.phone_number, products: [video, hardware])
      order2 = Order.create!(customer_contact: Faker::PhoneNumber.phone_number, products: [cd, movie])
    end

  end
end
