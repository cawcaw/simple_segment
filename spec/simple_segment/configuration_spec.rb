require 'spec_helper'

describe SimpleSegment::Configuration do
  it 'requires a write_key' do
    expect {
      described_class.new(write_key: nil)
    }.to raise_error(ArgumentError)
  end

  it 'works with symbol keys' do
    config = described_class.new(write_key: 'test')
    expect(config.write_key).to eq ('test')
  end

  it 'works with string keys' do
    config = described_class.new('write_key' => 'key')
    expect(config.write_key).to eq ('key')
  end

  context 'defaults' do
    it 'has a default error handler' do
      config = described_class.new(write_key: 'test')
      expect(config.on_error).to be_a(Proc)
    end
  end

  it 'works with stub' do
    config = described_class.new(write_key: 'test', stub: true)
    expect(config.stub).to eq true
  end

  it 'works with user prefered logging' do
    config = described_class.new(
      write_key: 'test',
      logger: Logger.new(STDOUT)
    )
    expect(config.logger).not_to be_nil
  end
end
