class Library
  attr_accessor :books, :orders, :readers, :authors
  def initialize()
    @orders = []
    @books = []
    @readers = []
    @authors = []
  end
end


index = Controllers.new
puts "Who often takes the book \r\n #{index.who_often_takes_the_books}"
puts "What is the most popular book: \r\n #{index.what_is_the_most_popular_book}"
puts "How many people ordered one of the three most popular books \r\n #{index.how_many_people_ordered_one_of_the_three_most_popular_books}"
