require "spec_helper"
require "opic"

describe Opic do

  context 'API Key' do
    it 'raises an exception when not present' do
      expect(Opic.get('foobar')).to raise_error
    end

    it 'does not complain when present' do
      Opic.api_key = '1234'
      Opic.get('foobar')
    end
  end

end
