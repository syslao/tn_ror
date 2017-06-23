class Station
  include Validation
  attr_reader :name
  attr_accessor :trains
  @@instances = []

  validate :name, :presence

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@instances << self
  end

  def self.all
    @@instances
  end

  def add_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains_type(type)
    result = @trains.select { |train| train.type == type }
    puts "Trains of type #{type}: #{result.length}"
  end

  def trains_blk
    raise 'Station is empty' if @trains.empty?
    @trains.each { |train| yield(train) }
  end
end
