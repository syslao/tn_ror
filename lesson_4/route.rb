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