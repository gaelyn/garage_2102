require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'

class OwnerTest < Minitest::Test
  def setup
    @owner_1 = Owner.new('Regina George', 'Heiress')
  end

  def test_it_exists
    assert_instance_of Owner, @owner_1
  end

  def test_it_has_attributes
    assert_equal @owner_1.name, "Regina George"
    assert_equal @owner_1.occupation, "Heiress"
    assert_equal @owner_1.cars, []
  end

  def test_it_can_buy_car
    @owner_1.buy('1967 Green Ford Mustang')
    assert_equal @owner_1.cars[0].class, Car

    @owner_1.buy('2001 Silver BMW 3-Series')
    assert_equal @owner_1.cars[1].class, Car
  end

  def test_vintage_cars
    @owner_1.buy('1967 Green Ford Mustang')
    @owner_1.buy('2001 Silver BMW 3-Series')
    @owner_1.buy('1963 Red Chevrolet Corvette')

    assert_equal 2, @owner_1.vintage_cars.count
    assert_equal "Mustang", @owner_1.vintage_cars[0].model
    assert_equal "Corvette", @owner_1.vintage_cars[1].model
  end
end
