class Station
  attr_reader :name, :trains
  @@instances = []

  def initialize(name)
    @name = name
    @trains = []
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

  def trains
    puts "#{@trains.length} train/s on station"
    @trains.each { |train| puts "Number #{train.number}" }
  end

  def trains_type(type)
    result = @trains.select { |train| train.type == type }
    puts "Trains of type #{type}: #{result.length}"
  end
end
