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

def create_station
  name = gets.capitalize
  station = Station.new(name)
  puts "Станция #{name} создана"
  @stations.push(station)
end

def create_route
  name = gets.capitalize
  station = Station.new(name)
  puts "Станция #{name} создана"
  @stations.push(station)
end

loop do
puts 'Выберите действие:'
puts '1 - Создать станцию' #done
puts '2 - Создать маршрут'
puts '3 - Редактировать маршрут (добавить/удалить станцию)'
puts '4 - Создать поезд'
puts '5 - Управление движением поезда'
puts '6 - Добавить вагон'
puts '7 - Отцепить вагон'
puts '8 - Назначить поезду маршрут'
puts '9 - Список всех станций c поездами'
puts '0 - Выход'

user_input = gets.to_i

case user_input
  when 1
    create_station
  when 0
    abort
  else
    puts "Неизвестная команда!"
    end
end

