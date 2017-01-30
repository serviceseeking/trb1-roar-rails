require 'trb1-representable/json/collection'
require 'trb1-representable/json/hash'

# Represents a validators hash for a model.
module ValidatorsRepresenter
  class ValidatorClient
    attr_accessor :kind, :options
  end

  # Represents a single Validator instance.
  module ValidatorRepresenter
    include Trb1::Roar::JSON
    property :kind
    hash :options
  end

  # Represents an array of validators for an attribute.
  module AttributeValidators
    include Trb1::Representable::JSON::Collection
    items :extend => ValidatorRepresenter, :class => ValidatorClient
  end

  include Trb1::Representable::JSON::Hash
  values :extend => AttributeValidators, :class => Array
end
