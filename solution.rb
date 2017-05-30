class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find do |customer|
      customer.full_name == name
    end
  end

  def self.find_all_by_first_name(name)
    self.all.select do |customer|
      customer.first_name == name
    end
  end

  def self.all_names
    @@all.map do |customer|
      customer.full_name
    end
  end

  def add_review(restaurant, content)
    review = Review.new(restaurant, content)
    review.customer = self
  end
end


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



class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find { |restaurant| restaurant.name == name }
  end

  def reviews
    Review.all.select do |review|
      review.restaurant == self
    end
  end

  def customers
    self.reviews.map do |review|
      review.customer
    end.uniq
  end
end
