class Garage
  attr_reader :name,
              :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(owner)
    @customers << owner
  end

  def all_cars
    all_cars = []
    @customers.each do |customer|
      customer.cars.map do |car|
        all_cars << car
      end
    end
    all_cars
  end

  def cars_by_make
    all_cars.group_by do |car|
      car.make
    end
  end

  def oldest_cars
    sorted_by_age = all_cars.sort_by do |car|
      car.age
    end

    oldest = Array.new
    3.times do
      oldest << sorted_by_age.pop
    end
    oldest
  end
end
