require "rails/railtie"
require "trb1-roar/rails/url_methods"

module Trb1
  module Roar
    module Rails
      class Railtie < ::Rails::Railtie
        config.representer = ActiveSupport::OrderedOptions.new

        rescue_responses = config.action_dispatch.rescue_responses || ActionDispatch::ShowExceptions.rescue_responses #newer or fallback to 3.0
        rescue_responses.merge!(
            'Trb1::Roar::Rails::ControllerAdditions::UnsupportedMediaType' => :unsupported_media_type
        )

        initializer "trb1.roar.set_configs" do |app|
          ::Trb1::Roar::Representer.module_eval do
            include app.routes.url_helpers
            include app.routes.mounted_helpers unless Trb1::Roar::Rails.rails_version.~ 3.0

            include UrlMethods  # provide an initial #default_url_options.
          end
        end
      end
    end
  end
end
