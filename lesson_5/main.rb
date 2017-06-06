# encoding: utf-8

require_relative 'manufacturer'
require_relative 'instancecounter'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'interface'

interface = Interface.new

loop do
  interface.menu
  interface.input
end
