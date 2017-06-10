class PassengerTrain < Train
  def initialize(number, speed = 0)
    @type = :passenger
    super(number, speed)
  end
end
