# encoding: utf-8

require_relative 'module/manufacturer'
require_relative 'module/instancecounter'
require_relative 'module/validation'
require_relative 'module/acessors'
require_relative 'class/station'
require_relative 'class/route'
require_relative 'class/train'
require_relative 'class/cargo_train'
require_relative 'class/passenger_train'
require_relative 'class/wagon'
require_relative 'class/passenger_wagon'
require_relative 'class/cargo_wagon'
require_relative 'class/interface'

interface = Interface.new

loop do
  interface.menu
  interface.input
end
