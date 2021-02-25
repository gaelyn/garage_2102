class Owner
  attr_reader :name,
              :occupation,
              :cars
  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def buy(car_string)
    split_string = car_string.split
    @cars << Car.new({description: split_string[1..3].join(" "), year: split_string[0]})
  end

  def vintage_cars
    @cars.find_all do |car|
      car.age >= 25
    end 
  end
end
