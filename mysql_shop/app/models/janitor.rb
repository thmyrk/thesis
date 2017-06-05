class Janitor

  STAFF_COUNT = 50
  MUSIC_CD_COUNT = 100
  VIDEO_GAME_COUNT = 100
  HARDWARE_COUNT = 100
  MOVIE_COUNT = 100
  SALE_COUNT = 300

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
    product_infos = []
    MUSIC_CD_COUNT.times do
      details = MusicCd.new(artist: Faker::Book.title, genre: music_genre.sample)
      products << Product.new(product_info: details, name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300))
      product_infos << details
    end

    VIDEO_GAME_COUNT.times do
      details = VideoGame.new(genre: Faker::Book.genre, age_requirements: Faker::Number.between(3, 18))
      products << Product.new(product_info: details, name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300))
      product_infos << details
    end

    HARDWARE_COUNT.times do
      details = Hardware.new(warranty: Faker::Number.between(4, 24), purpose: Faker::Company.catch_phrase)
      products << Product.new(product_info: details, name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300))
      product_infos << details
    end

    MOVIE_COUNT.times do
      details = Movie.new(director: Faker::Name.name, genre: Faker::Book.genre, age_requirements: Faker::Number.between(3, 18))
      products << Product.new(product_info: details, name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 150), price: Faker::Number.between(5, 300))
      product_infos << details
    end

    sales = []
    transactions = []
    SALE_COUNT.times do
      sale = Sale.new(price: Faker::Commerce.price, staff: staff.sample, products: [products.sample, products.sample])
      transactions << Transaction.new(sale: sale)
      sales << sale
    end

    [staff, sales, transactions, products, product_infos]
  end

  def self.save_records(records)
    records.each do |arr|
      arr.each(&:save!)
    end
  end
end
