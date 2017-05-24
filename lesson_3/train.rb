class Station
  attr_accessor :trains_on_station

  def initialize(name, trains_on_station = [])
    @name = name
    @trains_on_station = trains_on_station
  end

  def add_train(train)
    @trains_on_station << train
  end

  def send_train(train)
    @trains_on_station.delete(train)
  end

  def trains
    @trains_on_station
  end

  def trains_type
    result = @trains_on_station.each_with_object(Hash.new(0)) { |trains, counts| counts[trains.type] += 1 }
    result.each { |k, v| puts "Trains of type #{k}: #{v}" }
  end
end

class Route
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
  end

  def add_station
  end

  def del_station
  end

  def stations_list
  end
end

class Train
  attr_accessor :speed
  attr_reader :quantity
  attr_reader :type

  def initialize(number, type, quantity, speed = 0)
    @number = number
    @type = type.to_sym
    @quantity = quantity
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def something(arg)
  end

  def current_statin
  end

  def prev_statin
  end

  def next_statin
  end
end
