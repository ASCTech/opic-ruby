require "spec_helper"
require "opic"

describe Opic do

  it 'raises an exception when no API key is present' do
    expect(Opic.get('foobar')).to raise_error
  end

  it 'does not complain when an API key is present' do
    Opic.api_key = '1234'
    Opic.get('foobar')
  end
end
