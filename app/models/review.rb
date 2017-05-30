class Review

  attr_accessor :customer, :restaurant

  @@all = []

  def initialize(restaurant, content)
    @restaurant = restaurant
    @customer
    @content = content
    @@all << self
  end

  def self.all
    @@all
  end

  def customer
    @customer
  end

  def restaurant
    @restaurant
  end

  

end
