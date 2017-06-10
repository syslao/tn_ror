# encoding: utf-8

class Interface
  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
  end

  def menu
    puts 'Выберите действие:'
    puts '1 - Создать станцию'
    puts '2 - Создать маршрут'
    puts '3 - Редактировать маршрут (добавить/удалить станцию)'
    puts '4 - Создать поезд'
    puts '5 - Управление движением поезда'
    puts '6 - Создать вагон'
    puts '7 - Добавить вагон'
    puts '8 - Отцепить вагон'
    puts '9 - Назначить поезду маршрут'
    puts '10 - Список всех станций'
    puts '11 - Список поездов на станции'
    puts '12 - Список вагонов у поезда'
    puts '0 - Выход'
  end

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
      new_train = PassengerTrain.new(n)
      @trains.push(new_train)
      puts "Пассажирский поезд номер #{new_train.number} создан!"
    when 2
      new_train = CargoTrain.new(n)
      @trains.push(new_train)
      puts "Грузовой поезд номер #{new_train.number} создан!"
    else
      puts 'Неизвестный тип поезда!'
    end
  rescue => e
    puts e.message
    create_train
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
  rescue => e
    puts e.message
    edit_route
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
  rescue => e
    puts e.message
    move_train
  end

  def assign_route
    choise_train.add_route(choise_route)
  end

  def add_wagon
    train = choise_train
    train.add_wagon(choise_wagon)
    puts "У поезда #{train.wagons_quantity} вагона/ов"
  rescue => e
    puts e.message
    return
  end

  def create_wagon
    puts 'Выберете тип вагона (1 - пассажирский, 2 - грузовой) и количество мест или объем через запятую'
    t, v = gets.split(',')
    case t.to_i
    when 1
      new_wagon = PassengerWagon.new(v)
      @wagons.push(new_wagon)
      puts "Пассажирский вагон на #{new_wagon.seats} мест создан!"
    when 2
      new_wagon = CargoWagon.new(v)
      @wagons.push(new_wagon)
      puts "Грузовой вагон с объемом #{new_wagon.payload} создан!"
    else
      puts 'Неизвестный тип вагона!'
    end
  rescue => e
    puts e.message
    create_train
  end

  def remove_wagon
    train = choise_train
    train.remove_wagon
    puts "У поезда #{train.wagons_quantity} вагона/ов"
  rescue => e
    puts e.message
    return
  end

  def all_stations_list
    @stations.each.with_index(1) { |val, index| puts "#{index} - #{val.name}" }
  end

  def stations_with_trains_list
    choise_station.trains_blk { |train| puts "#{train.number} #{train.type} #{train.wagons.length}" }
  rescue => e
    puts e.message
    return
  end

  def wagon_list
    choise_train.wagons_blk(lambda_method)
  end

  def lambda_method  #рубокоп ругается на многострочные лямды и говорит использовать метод, тут я в замешательстве
  ->wagon, index {
    puts "#{index} #{wagon.type} #{wagon.seats} #{wagon.free_seats}" if wagon.type == :passenger
    puts "#{index} #{wagon.type} #{wagon.payload} #{wagon.free_payload}" if wagon.type == :cargo
  }
  end

  def input
    user_input = gets.to_i

    case user_input
    when 1
      create_station
    when 2
      @stations.length > 1 ? create_route : puts('Для создания маршрута нужно минимум 2 станции')
    when 3
      edit_route
    when 4
      create_train
    when 5
      move_train
    when 6
      create_wagon
    when 7
      add_wagon
    when 8
      remove_wagon
    when 9
      assign_route
    when 10
      all_stations_list
    when 11
      stations_with_trains_list
    when 12
      wagon_list
    when 0
      abort
    else
      puts 'Неизвестная команда!'
    end
  end

  private

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

  def choise_wagon
    puts 'Выберите вагон из списка'
    @wagons.each.with_index(1) { |val, index| puts "#{index} - #{val.type}" }
    @wagons[gets.chomp.to_i - 1]
  end
end
