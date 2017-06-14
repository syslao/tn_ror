class PassengerWagon < Wagon
  include Validate
  attr_reader :seats, :booked_seats
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

  private

  def validate!
    raise 'Seats cant be nil' if seats.nil?
    raise 'Seats should be more than 0' if seats < 1
    true
  end
end
