# frozen_string_literal: true

require 'hotreload/version'
require 'hotreload/railtie'

require 'listen'
require 'turbo-rails'

module Hotreload
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
      klass.broadcast_append_to('hotreload', target: 'hotreload', content: '<span />')
    end
  end
end
