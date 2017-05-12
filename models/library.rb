class Library
  attr_accessor :books, :orders, :readers, :authors
  def initialize()
    @orders = []
    @books = []
    @readers = []
    @authors = []
  end
end
