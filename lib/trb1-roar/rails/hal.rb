require 'trb1-roar/json/hal'

Trb1::Roar::JSON::HAL.class_eval do
  def to_hal(*args);   to_json(*args);   end
  def from_hal(*args); from_json(*args); end
end
