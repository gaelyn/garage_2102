require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'
require './lib/garage'

class GarageTest < Minitest::Test
  def setup
    @garage = Garage.new('Totally Safe Parking')
    @owner_1 = Owner.new('Regina George', 'Heiress')
    @owner_1.buy('1967 Green Ford Mustang')
    @owner_1.buy('2001 Blue Ford Escape')
    @owner_2 = Owner.new('Glen Coco', 'Unknown')
    @owner_2.buy('1963 Green Chevrolet Corvette')
    @owner_2.buy('2020 Silver Volvo XC90')
  end

  def test_it_exists
    assert_instance_of Garage, @garage
  end

  def test_it_has_a_name
    assert_equal 'Totally Safe Parking', @garage.name
  end

  def test_it_can_add_customer
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal @garage.customers, [@owner_1, @owner_2]
  end

  def test_it_has_all_cars
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal @garage.all_cars.count, 4
    assert_equal @garage.all_cars[0].class, Car
    assert_equal @garage.all_cars[0].model, "Mustang"
  end

  def test_it_can_find_cars_by_make
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal @garage.cars_by_make.class, Hash
    assert_equal @garage.cars_by_make["Ford"][0].model, "Mustang"
    assert_equal @garage.cars_by_make["Volvo"][0].model, "XC90"
  end

  def test_it_can_find_oldest_cars
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal @garage.oldest_cars.count, 3
    assert_equal @garage.oldest_cars[0].age, 58
    assert_equal @garage.oldest_cars[1].age, 54
    assert_equal @garage.oldest_cars[2].age, 20
  end
end
