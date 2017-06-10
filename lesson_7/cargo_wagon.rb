class CargoWagon < Wagon
  include Validate
  attr_reader :payload, :taked_payload
  def initialize(payload)
    @type = :cargo
    @payload = payload
    @taked_payload = 0
    validate!
  end

  def take_payload(value)
    @taked_payload += value
  end

  def free_payload
    @payload - @taked_payload
  end

  private

  def validate!
    raise 'Value cant be nil' if payload.nil?
    raise 'Value should be more than 0' if payload < 1
    true
  end
end
