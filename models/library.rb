class Library
  attr_accessor :books, :orders, :readers, :authors
  def initialize()
    @orders = []
    @books = []
    @readers = []
    @authors = []
  end
end

require './models/Author.rb'
require './models/Book.rb'
require './models/Reader.rb'
require './models/Order.rb'
require './models/Library.rb'
require 'YAML'

class Controllers
  def initialize
    @Lib = Library.new
  end

  def test_data_load
    @Lib.books << Book.new("Martian", "Andy Weir")
    @Lib.authors << Author.new("Andy Weir","Biography of Andy Weir")
    @Lib.books << Book.new("Triumphal Arch", "Erich Maria Remarque")
    @Lib.authors << Author.new("Erich Maria Remarque","Biography of Erich Maria Remarque")
    @Lib.books << Book.new("Virgin Soil Upturned", "Mikhail Sholokhov")
    @Lib.books << Book.new("Quiet Flows the Don", "Mikhail Sholokhov")
    @Lib.authors << Author.new("Mikhail Sholokhov","Biography of Mikhail Sholokhov")
    @Lib.books << Book.new("Dog's heart", "Michael Bulgakov")
    @Lib.books << Book.new("The Master and Margarita", "Michael Bulgakov")
    @Lib.books << Book.new("The White Guard", "Michael Bulgakov")
    @Lib.authors << Author.new("Michael Bulgakov","Biography of Michael Bulgakov")
    @Lib.books << Book.new("Alchemist", "Paulo Coelho")
    @Lib.books << Book.new("Eleven minutes", "Paulo Coelho")
    @Lib.authors << Author.new("Paulo Coelho","Biography of Paulo Coelho")
    @Lib.readers << Reader.new("Test User 1", "test_user_1@test.com", "Sity 1", "Street 1", "1")
    @Lib.readers << Reader.new("Test User 2", "test_user_2@test.com", "Sity 2", "Street 2", "2")
    @Lib.readers << Reader.new("Test User 3", "test_user_3@test.com", "Sity 3", "Street 3", "3")
    @Lib.readers << Reader.new("Test User 4", "test_user_4@test.com", "Sity 4", "Street 4", "4")
    @Lib.readers << Reader.new("Test User 5", "test_user_5@test.com", "Sity 5", "Street 5", "5")
    @Lib.readers << Reader.new("Test User 6", "test_user_6@test.com", "Sity 6", "Street 6", "6")
    @Lib.readers << Reader.new("Test User 7", "test_user_7@test.com", "Sity 7", "Street 7", "7")
    @Lib.readers << Reader.new("Test User 8", "test_user_8@test.com", "Sity 8", "Street 8", "8")
    @Lib.readers << Reader.new("Test User 9", "test_user_9@test.com", "Sity 9", "Street 9", "9")
    @Lib.readers << Reader.new("Test User 10", "test_user_10@test.com", "Sity 10", "Street 10", "10")
    @Lib.orders << Order.new("Martian", "Test User 5", "01.05.2016")
    @Lib.orders << Order.new("Martian", "Test User 5", "02.05.2016")
    @Lib.orders << Order.new("Martian", "Test User 3", "01.05.2016")
    @Lib.orders << Order.new("Triumphal Arch", "Test User 5", "21.05.2016")
    @Lib.orders << Order.new("Triumphal Arch", "Test User 5", "21.05.2016")
    @Lib.orders << Order.new("Triumphal Arch", "Test User 5", "11.05.2016")
    @Lib.orders << Order.new("Triumphal Arch", "Test User 5", "01.05.2016")
    @Lib.orders << Order.new("Alchemist", "Test User 1", "09.05.2016")
    @Lib.orders << Order.new("Alchemist", "Test User 5", "09.05.2016")
    @Lib.orders << Order.new("Alchemist", "Test User 5", "08.05.2016")
    @Lib.orders << Order.new("Alchemist", "Test User 9", "08.05.2016")
    @Lib.orders << Order.new("Alchemist", "Test User 10", "08.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    @Lib.orders << Order.new("Dog's heart", "Test User 6", "10.05.2016")
    save_library_data_to_file
  end

  def save_library_data_to_file
    File.write("./data.yaml", @Lib.to_yaml)
  end
  
  class Controllers
  def initialize
    @lib = get_all_library_data_from_file
  end

  def who_often_takes_the_books
    readers_order = @lib.orders.group_by { |order| order.reader }.sort_by { |k, v| v.count }.reverse[0][0]
    @lib.readers.find{|reader| reader.name == readers_order}.to_s
  end

  def what_is_the_most_popular_book
    @lib.books.find{|book| book.title == get_books[0][0]}.to_s
  end

  def how_many_people_ordered_one_of_the_three_most_popular_books
    get_books[0..2].map{|k,v| v}.flatten.map{|order| order.reader}.uniq.count
  end

  def get_books
    @lib.orders.group_by { |order| order.book }.sort_by { |k, v| v.count }.reverse
  end

  def get_all_library_data_from_file
    return YAML.load(File.read("./data.yaml"))
  end

  def save_library_data_to_file
    File.write("./data.yaml", @lib.to_yaml)
  end
end

end

index = Controllers.new
index.test_data_load

index = Controllers.new
puts "Who often takes the book \r\n #{index.who_often_takes_the_books}"
puts "What is the most popular book: \r\n #{index.what_is_the_most_popular_book}"
puts "How many people ordered one of the three most popular books \r\n #{index.how_many_people_ordered_one_of_the_three_most_popular_books}"
