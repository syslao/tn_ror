class Station
  attr_reader :name, :trains_on_station

  def initialize(name)
    @name = name
    @trains_on_station = []
  end

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

  def trains_type(type)
    result = @trains_on_station.select { |train| train.type == type }
    puts "Trains of type #{type}: #{result.length}"
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
    if @route_list.length == 2
      puts 'cant delete, only 2 stations left'
    else
      @route_list.delete(station)
    end
  end

  def stations_list
    @route_list.each { |station| puts station.name }
  end
end

class Train
  attr_reader :number, :quantity, :type, :current_station, :next_station, :prev_station
  attr_writer :speed
  def initialize(number, type, quantity, speed = 0)
    @number = number.to_s
    @type = type.to_sym
    @quantity = quantity
    @speed = speed
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

  def add_wagon
    return puts 'Train in motion' if @speed > 0
    @quantity += 1
  end

  def remove_wagon
    return puts 'Train in motion' if @speed > 0
    @quantity > 0 ? @quantity -= 1 : (puts 'There are no more wagons to remove')
  end

  def add_route(route)
    @route_list = route.stations_list
    @current_station = @route_list[0]
    @next_station = @route_list[1]
    @prev_station = nil
  end

  def next
    if @route_list.index(@current_station) == @route_list.length - 1
      puts 'its last station'
    else
      index_next_station = @route_list.index(@current_station) + 1
      @next_station = @route_list[index_next_station + 1]
      @prev_station = @current_station
      @current_station = @route_list[index_next_station]
    end
  end

  def prev
    if @route_list.index(@current_station).zero?
      puts 'its first station'
    else
      index_prev_station = @route_list.index(@current_station) - 1
      @next_station = @current_station
      @prev_station = index_prev_station.zero? ? nil : @route_list[index_prev_station - 1]
      @current_station = @route_list[index_prev_station]
    end
  end
end
