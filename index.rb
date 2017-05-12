require './models/author.rb'
require './models/book.rb'
require './models/reader.rb'
require './models/order.rb'
require './models/library.rb'
require 'YAML'

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

index = Controllers.new
puts "Who often takes the book \r\n #{index.who_often_takes_the_books}"
puts "What is the most popular book: \r\n #{index.what_is_the_most_popular_book}"
puts "How many people ordered one of the three most popular books \r\n #{index.how_many_people_ordered_one_of_the_three_most_popular_books}"
