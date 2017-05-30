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

class PassengerTrain < Train

end

class CargoTrain < Train

end

class Wagon
end

class PassengerWagon < Wagon

end

class CargoWagon < Wagon

end



