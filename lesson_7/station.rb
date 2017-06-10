class Station
  include Validate
  attr_reader :name, :trains
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

  def trains
    puts "#{@trains.length} train/s on station"
    @trains.each { |train| puts "Number #{train.number}" }
  end

  def trains_type(type)
    result = @trains.select { |train| train.type == type }
    puts "Trains of type #{type}: #{result.length}"
  end

  private

  def validate!
    raise 'Name cant be nil' if name.nil?
    raise 'Name should be at least 2 symbols' if name.length < 2
    true
  end
end
