class Car
  attr_reader :make,
              :model,
              :color,
              :year,
              :age
  def initialize(info)
    split_string = info[:description].split
    @make = split_string[1]
    @model = split_string[2]
    @color = split_string[0]
    @year = info[:year]
    # @age = 2021 - (info[:year].to_i)
  end

  def age
    Time.now.year - @year.to_i
  end
end
