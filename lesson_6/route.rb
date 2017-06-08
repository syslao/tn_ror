class Route
  
  attr_reader :route_list
  def initialize(first_station, last_station)
    @route_list = [first_station, last_station]
    validate!
  end

  def validate!
    raise "First station can't be nil" if @route_list[0].nil?
    raise "Last station can't be nil" if @route_list[-1].nil?
    raise "Can`t add not station object to first station" if @route_list[0].class != Station
    raise "Can`t add not station object to last station" if @route_list[-1].class != Station
    true
  end

  def add_station(station)
    return puts 'already in route list' if @route_list.include?(station)
    @route_list.insert(-2, station)
  end

  def del_station(station)
    if @route_list.length == 2
      puts 'cant delete, only 2 stations left'
    else
      @route_list.delete(station)
    end
  end

  def stations_list
    @route_list.each(&:name)
  end
end
