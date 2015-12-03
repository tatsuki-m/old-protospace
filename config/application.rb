require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module Protospace
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]

    config.generators do |g|
      g.template_engine      false
      g.test_framework       false
      g.helper               false
      g.stylesheets          false
      g.javascripts          false
    end
  end
end
