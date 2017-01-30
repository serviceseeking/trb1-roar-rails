require 'trb1-roar/json/json_api'

Trb1::Roar::JSON::JSONAPI.class_eval do
  def to_json_api(*args);   to_json(*args);   end
  def from_json_api(*args); from_json(*args); end
end

