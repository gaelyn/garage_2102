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

  #Megan's method
  def all_cars
    @customers.flat_map do |customer|
      customer.cars
    end
  end

  # def all_cars
  #   all_cars = []
  #   @customers.each do |customer|
  #     customer.cars.map do |car|
  #       all_cars << car
  #     end
  #   end
  #   all_cars
  # end

  def cars_by_make
    all_cars.group_by do |car|
      car.make
    end
  end

  #cars by make using each; Megan's method
  # def cars_by_make
  #   grouped_cars = {}
  #   grouped_cars.each do |car|
  #     #line below says that if this is the first time [car.make] key has been seen,
  #     # an array will be created for the values to get shoveled into. If it has already
  #     # been created then .nil? will return false and that line will be ignored.
  #     grouped_cars[car.make] = [] if grouped_cars[car.make].nil?
  #     grouped_cars[car.make] << car
  #   end
  #   grouped_cars
  # end

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

  #Megan's method
  # def oldest_cars
  #   # sorted_cars = all_cars.sort_by do |car|
  #   #   #minus symbol `-` reveses the order
  #   #   -car.age
  #   # end
  #   # sorted_cars[0..3]
  #
  #   #OR
  #
  #   all_cars.max_by(3) do |car|
  #     car.age
  #   end
  #
  # end

  #Iteration 4
  def owner_of_oldest_car
    old_car = oldest_cars.first

    @customers.find do |customer|
      customer.cars.include?(old_car)
    end.name
  end

  def cars_in_range(range)
    #Range is another collection type. Can call enumerables on it.
    all_cars.find_all do |car|
      range.include?(car.year.to_i)
    end 
  end
end
