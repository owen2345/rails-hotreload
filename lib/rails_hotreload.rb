# frozen_string_literal: true

require 'rails_hotreload/version'
require 'rails_hotreload/railtie'

require 'listen'
require 'turbo-rails'

module RailsHotreload
  class Checker
    attr_reader :paths

    def initialize(paths)
      @paths = paths
    end

    def call
      puts "Listening for changes in #{paths}"
      listener = Listen.to(*paths, {}) { stream_reload }
      listener.start
      sleep
    end

    private

    def stream_reload
      puts 'Changes detected, reloading...'
      klass = Turbo::StreamsChannel
      klass.broadcast_append_to('rails_hotreload', target: 'rails_hotreload', content: '<span />')
    end
  end
end
