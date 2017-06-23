class CargoTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number, speed = 0)
    @type = :cargo
    super(number, speed)
  end
end
