class PassengerWagon < Wagon
  include Validation

  attr_reader :seats, :booked_seats

  validate :seats, :presence
  validate :seats, :quantity, 1

  def initialize(seats)
    @type = :passenger
    @seats = seats.to_i
    @booked_seats = 0
    validate!
  end

  def take_seat
    result = @booked_seats + 1
    raise 'No more free seats' if result > @seats
    @booked_seats = result
  end

  def free_seats
    @seats - @booked_seats
  end
end
