class Janitor

  STAFF_COUNT = 50
  MUSIC_CD_COUNT = 100
  VIDEO_GAME_COUNT = 100
  HARDWARE_COUNT = 100
  MOVIE_COUNT = 100
  SALE_COUNT = 300
  TRANSACTION_COUNT = 300

  def self.delete_records
    puts "Deleting existing records"
    [Staff, Sale, Transaction, Product].each(&:delete_all)
  end

  def self.generate_records
    puts "Generating records"
    music_genre = ["Jazz", "Rock", "Blues", "Alternative", "Indie", "Electronic", "Hip hop", "Trance" "Techno", "Metal", "Rockabilly", "Surf", "Pop", "Punk"]

    staff = []
    STAFF_COUNT.times do
      staff << Staff.new(position: Faker::Company.profession, name: Faker::Name.first_name)
    end

    products = []
    MUSIC_CD_COUNT.times do
      products << MusicCd.new(name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300), artist: Faker::Book.title, genre: music_genre.sample)
    end

    VIDEO_GAME_COUNT.times do
      products << VideoGame.new(name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300), genre: Faker::Book.genre, age_requirements: Faker::Number.between(3, 18))
    end

    HARDWARE_COUNT.times do
      products << Hardware.new(name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300), warranty: Faker::Number.between(4, 24), purpose: Faker::Company.catch_phrase)
    end

    MOVIE_COUNT.times do
      products << Movie.new(name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300), director: Faker::Name.name, genre: Faker::Book.genre, age_requirements: Faker::Number.between(3, 18))
    end

    sales = []
    SALE_COUNT.times do
      sales << Sale.new(price: Faker::Commerce.price, staff: staff.sample, products: [products.sample, products.sample])
    end

    transactions = []
    TRANSACTION_COUNT.times do
      transactions << Transaction.new(sale: sales.sample)
    end

    [staff, sales, transactions, products]
  end

  def self.save_records(records)
    records.each do |arr|
      arr.each(&:save!)
    end
  end
end
