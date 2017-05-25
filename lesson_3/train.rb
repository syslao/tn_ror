class Station
  attr_accessor :trains_on_station
  attr_reader :name

  def initialize(name)
    @name = name
  end

  @trains_on_station = []

  def add_train(train)
    @trains_on_station << train
  end

  def send_train(train)
    @trains_on_station.delete(train)
  end

  def trains
    puts "#{@trains_on_station.length} train/s on station"
    @trains_on_station.each { |train| puts "Number #{train.number}" }
  end

  def trains_type
    result = @trains_on_station.each_with_object(Hash.new(0)) { |trains, counts| counts[trains.type] += 1 }
    result.each { |k, v| puts "Trains of type #{k}: #{v}" }
  end
end

class Route
  def initialize(first_station, last_station)
    @route_list = [first_station, last_station]
  end

  def add_station(station)
    @route_list.include?(station) ? (puts 'already in route list') : @route_list.insert(-2, station)
  end

  def del_station(station)
    @route_list.delete(station)
  end

  def stations_list
    @route_list.each { |station| puts station.name }
  end
end

class Train
  attr_reader :number, :quantity, :type
  attr_accessor :speed, :current_station, :route_list

  def initialize(number, type, quantity, speed = 0)
    @number = number
    @type = type.to_sym
    @quantity = quantity
    @speed = speed
    @current_station = {}
  end

  def stop
    @speed = 0
  end

  def current_speed
    puts @speed
  end

  def wagons_quantity
    puts @quantity
  end

  def wagons(arg)
    return puts 'Train in motion' if @speed > 0
    if arg == 'add'
      @quantity += 1
    elsif arg == 'remove'
      @quantity > 0 ? @quantity -= 1 : (puts 'There are no more wagons to remove')
    end
  end

  def add_route(route)
    @route_list = route.stations_list
    @current_station = @route_list[0]
  end

  def next
    if @route_list.index(@current_station) == @route_list.length - 1
      puts "its last station"
    else
      index_next_station = @route_list.index(@current_station) + 1
      @current_station = @route_list[index_next_station]
  end
  end

  def prev
    if @route_list.index(@current_station).zero?
      puts 'its first station'
    else
      index_prev_station = @route_list.index(@current_station) - 1
      @current_station = @route_list[index_prev_station]
    end
  end

  def next_station
  end

  def prev_station
  end
end
