class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number, :current_station, :next_station, :prev_station, :wagons
  attr_writer :speed
  @@instances = {}

  def initialize(number, speed = 0)
    @number = number.to_s
    @speed = speed
    @wagons = []
    @@instances[number] = self
    register_instance
  end

  def self.find(number)
    @@instances[number]
  end

  def stop
    @speed = 0
  end

  def current_speed
    puts @speed
  end

  def wagons_quantity
    @wagons.length
  end

  def add_wagon(wagon)
    return puts 'Train in motion' if @speed > 0
    @wagons.push(wagon)
  end

  def remove_wagon
    return puts 'Train in motion' if @speed > 0
    @wagons.empty? ? puts('No more wagons') : @wagons.pop
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
