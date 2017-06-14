class Station
  include Validate
  attr_reader :name
  attr_accessor :trains
  @@instances = []

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

  private

  def validate!
    raise 'Name cant be nil' if name.nil?
    raise 'Name should be at least 2 symbols' if name.length < 2
    true
  end
end
