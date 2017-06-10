module Validate
  def valid?
    validate!
  rescue
    false
  end
end
