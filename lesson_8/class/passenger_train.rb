class PassengerTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number, speed = 0)
    @type = :passenger
    super(number, speed)
  end
end
