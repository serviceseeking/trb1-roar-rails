require "trb1-roar/rails/version"
require "trb1-roar/representer"
require "trb1-roar/decorator"
require "trb1-roar/rails/railtie"

module Trb1
  module Roar
    autoload("XML", "trb1-roar/xml")
    autoload("JSON", "trb1-roar/json")

    module JSON
      autoload("HAL", "trb1-roar/rails/hal")
      autoload("JSONAPI", "trb1-roar/rails/json_api")
    end

    autoload("Hypermedia", "trb1-roar/hypermedia")
  end
end

module Trb1
  module Roar
    module Rails
      require 'trb1-uber/version'
      def self.rails_version
        Trb1::Uber::Version.new(::ActionPack::VERSION::STRING)
      end

      if rails_version.~ 3.0
        require 'trb1-roar/rails/rails3_0_strategy'
      elsif rails_version.~ 3.1
        require 'trb1-roar/rails/rails3_1_strategy'
      elsif rails_version.~ 3.2
        require 'trb1-roar/rails/rails3_2_strategy'
      elsif rails_version.~ 4.2
        require 'trb1-roar/rails/rails4_2_strategy'
      else
        # fallback to 4.0 strategy
        require 'trb1-roar/rails/rails4_0_strategy'
      end

      autoload("TestCase", "trb1-roar/rails/test_case")
    end
  end
end

require "trb1-roar/rails/controller_additions"
