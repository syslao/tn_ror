class Station
  attr_reader :name, :trains_on_station

  def initialize(name)
    @name = name
    @trains_on_station = []
  end

  def add_train(train)
    @trains_on_station << train
  end

  def send_train(train)
    @trains_on_station.delete(train)
  end

  def trains
    puts "#{@trains_on_station.length} train/s on station"
    @trains_on_station.each { |train| puts "Number #{train.number}" }
  end

  def trains_type(type)
    result = @trains_on_station.select { |train| train.type == type }
    puts "Trains of type #{type}: #{result.length}"
  end
end
