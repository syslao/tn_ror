class CargoWagon < Wagon
  include Validation
  attr_reader :payload, :taked_payload

  validate :payload, :presence
  validate :payload, :quantity, 1

  def initialize(payload)
    @type = :cargo
    @payload = payload.to_i
    @taked_payload = 0
    validate!
  end

  def take_payload(value)
    result = @taked_payload + value
    raise 'No more free value' if result > @payload
    @taked_payload = result
  end

  def free_payload
    @payload - @taked_payload
  end
end
