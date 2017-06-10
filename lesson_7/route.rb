class Route
  include Validate
  attr_reader :route_list
  def initialize(first_station, last_station)
    @route_list = [first_station, last_station]
    validate!
  end

  def add_station(station)
    raise 'already in route list' if @route_list.include?(station)
    @route_list.insert(-2, station)
  end

  def del_station(station)
    raise 'cant delete, only 2 stations left' if @route_list.length == 2
    @route_list.delete(station)
  end

  def stations_list
    @route_list.each(&:name)
  end

  private

  def validate!
    raise 'Can`t add not station object to first station' if @route_list[0].class != Station
    raise 'Can`t add not station object to last station' if @route_list[-1].class != Station
    true
  end
end
