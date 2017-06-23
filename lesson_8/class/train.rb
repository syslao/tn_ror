class Train
  include Manufacturer
  include InstanceCounter
  include Validation
  attr_reader :number, :current_station, :next_station, :prev_station, :wagons, :type
  attr_writer :speed
  @@instances = {}
  NUMBER_FORMAT = /^[\d[A-Z]]{3}-?[\d[A-Z]]{2}$/i

  def initialize(number, speed = 0)
    @number = number.to_s.upcase
    @speed = speed
    @wagons = []
    validate!
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
    raise 'Train in motion' if @speed > 0
    raise 'Type of train and wagon not equal' if type != wagon.type
    @wagons.push(wagon)
  end

  def remove_wagon
    raise 'Train in motion' if @speed > 0
    @wagons.empty? ? raise('No more wagons') : @wagons.pop
  end

  def add_route(route)
    @route_list = route.stations_list
    @current_station = @route_list[0]
    @next_station = @route_list[1]
    @prev_station = nil
    @current_station.add_train(self)
  end

  def next
    raise 'its last station' if @route_list.index(@current_station) == @route_list.length - 1
    @current_station.send_train(self)
    index_next_station = @route_list.index(@current_station) + 1
    @next_station = @route_list[index_next_station + 1]
    @prev_station = @current_station
    @current_station = @route_list[index_next_station]
    @current_station.add_train(self)
  end

  def prev
    raise 'its first station' if @route_list.index(@current_station).zero?
    @current_station.send_train(self)
    index_prev_station = @route_list.index(@current_station) - 1
    @next_station = @current_station
    @prev_station = index_prev_station.zero? ? nil : @route_list[index_prev_station - 1]
    @current_station = @route_list[index_prev_station]
    @current_station.add_train(self)
  end

  def wagons_blk(block)
    raise 'Train is empty' if @wagons.nil?
    @wagons.each.with_index(1) { |wagon, index| block.call(wagon, index) }
  end
end
