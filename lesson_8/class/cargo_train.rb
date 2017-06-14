class CargoTrain < Train
  def initialize(number, speed = 0)
    @type = :cargo
    super(number, speed)
  end
end
