require 'morse_decoder.rb'

describe Morse_decoder do
  subject(:morse_decoder) { described_class }

  it 'responds to morse_decoder' do
    expect(morse_decoder).to respond_to(:decode_morse).with(1).argument
  end
end
