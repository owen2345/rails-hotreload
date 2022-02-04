# frozen_string_literal: true

require 'spec_helper'

module Turbo
  class StreamsChannel
    def self.broadcast_append_to(*streamables, **opts); end
  end
end

describe Hotreload::Checker do
  let(:paths) { %w[path1/path path2/somewhere] }
  let(:inst) { described_class.new(paths) }
  let(:listen_mock) { double(start: true) }
  before do
    allow(Listen).to receive(:to).and_return(listen_mock)
    allow(inst).to receive(:sleep)
    allow(Turbo::StreamsChannel).to receive(:broadcast_append_to)
  end

  it 'starts the file listener' do
    expect(Listen).to receive(:to).with(paths[0], paths[1], anything)
    inst.call
  end

  it 'sleeps the process to wait for file changes' do
    expect(inst).to receive(:sleep)
    inst.call
  end

  it 'streams via turbo to reload browser' do
    key = 'hotreload'
    klass = Turbo::StreamsChannel
    expect(klass).to receive(:broadcast_append_to).with(key, target: key, content: anything)
    inst.send(:stream_reload)
  end
end
