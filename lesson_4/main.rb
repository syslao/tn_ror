# encoding: utf-8

require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

@stations = []
@routes = []
@trains = []

def create_station
  puts 'Введите название станции:'
  name = gets.capitalize
  station = Station.new(name)
  puts "Станция #{name} создана"
  @stations.push(station)
end

def create_route
  puts 'Выберете станцию отправления и назначения из списка и введите через запятую'
  @stations.each.with_index(1) { |val, index| puts "#{index} - #{val.name}" }
  first, second = gets.split(',').map(&:to_i)
  route = Route.new(@stations[first - 1], @stations[second - 1])
  @routes.push(route)
end

def create_train
  puts 'Введите номер поезда и тип (1 - пассажирский, 2 - грузовой) через запятую'
  n, t = gets.split(',')
  case t.to_i
  when 1
    @trains.push(PassengerTrain.new(n))
  when 2
    @trains.push(CargoTrain.new(n))
  else
    puts 'Неизвестный тип поезда!'
    end
end

def edit_route
  route = choise_route
  puts "Выберете действие:\n1 - добавить станцию\n2 - удалить станцию"
  input = gets.chomp.to_i
  if input == 1
    puts 'Выберите станцию из списка'
    @stations.each.with_index(1) { |val, index| puts "#{index} - #{val.name}" }
    route.add_station(@stations[gets.chomp.to_i - 1])
  elsif input == 2
    puts 'Выберите станцию из мартшрута'
    route.route_list.each.with_index(1) { |val, index| puts "#{index} - #{val.name}" }
    route.del_station(route.route_list[gets.chomp.to_i - 1])
  else
    puts 'Неизвестный тип действия!'
  end
end

def move_train
  train = choise_train
  puts "Выберете действие:\n1 - Ехать вперед\n2 - Ехать назад"
  input = gets.chomp.to_i
  if input == 1
    train.next
  elsif input == 2
    train.prev
  else
    puts 'Неизвестный тип действия!'
  end
end

def assign_route
  choise_train.add_route(choise_route)
end

def choise_station
  puts 'Выберите станцию из списка'
  @stations.each.with_index(1) { |val, index| puts "#{index} - #{val.name}" }
  @stations[gets.chomp.to_i - 1]
end

def choise_train
  puts 'Выберите поезд из списка'
  @trains.each.with_index(1) { |val, index| puts "#{index} - #{val.number}" }
  @trains[gets.chomp.to_i - 1]
end

def choise_route
  puts 'Выберите маршрут из списка'
  @routes.each.with_index(1) { |val, index| print "#{index}. #{val.route_list[0].name} - #{val.route_list[-1].name}" }
  @routes[gets.chomp.to_i - 1]
end

def add_wagon
  train = choise_train
  train.add_wagon(PassengerWagon.new) if train.class == PassengerTrain
  train.add_wagon(CargoWagon.new) if train.class == CargoTrain
  puts "У поезда #{train.wagons_quantity} вагона/ов"
end

def remove_wagon
  train = choise_train
  train.remove_wagon
  puts "У поезда #{train.wagons_quantity} вагона/ов"
end

def all_stations_list
  @stations.each.with_index(1) { |val, index| puts "#{index} - #{val.name}" }
end

def stations_with_trains_list
  station = choise_station
  trains = @trains.select { |train| train.current_station == station }
  puts "на станции #{station.name} - #{trains.length} поезда/ов"
end

loop do
  puts 'Выберите действие:'
  puts '1 - Создать станцию'
  puts '2 - Создать маршрут'
  puts '3 - Редактировать маршрут (добавить/удалить станцию)'
  puts '4 - Создать поезд'
  puts '5 - Управление движением поезда'
  puts '6 - Добавить вагон'
  puts '7 - Отцепить вагон'
  puts '8 - Назначить поезду маршрут'
  puts '9 - Список всех станций'
  puts '10 - Список поездов на станции'
  puts '0 - Выход'

  user_input = gets.to_i

  case user_input
  when 1
    create_station
  when 2
    @stations.length > 1 ? create_route : (puts 'Для создания маршрута нужно минимум 2 станции')
  when 3
    edit_route
  when 4
    create_train
  when 5
    move_train
  when 6
    add_wagon
  when 7
    remove_wagon
  when 8
    assign_route
  when 9
    all_stations_list
  when 10
    stations_with_trains_list
  when 0
    abort
  else
    puts 'Неизвестная команда!'
    end
end
