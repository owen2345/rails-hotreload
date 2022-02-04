# frozen_string_literal: true

$stdout.sync = true
require 'listen'
namespace :hotreload do
  desc 'Start watching file changes. Sample: bin/rails hotreload:start app/assets/builds'
  task start: :environment do
    paths = (ARGV[0] || 'app/assets/builds,app/views/').to_s.split(',')
    paths = paths.map { |p| Rails.root.join(p).to_s }
    Hotreload::Checker.new(paths).call
  end
end
