# frozen_string_literal: true

require 'rails'
module Hotreload
  class Railtie < ::Rails::Railtie
    railtie_name :hotreload

    rake_tasks do
      load 'hotreload/lib/tasks/hotreload_tasks.rake'
    end

    config.before_initialize do |app|
      app.config.paths['app/views'].unshift(File.join(__dir__, 'views').to_s)
    end
  end
end
