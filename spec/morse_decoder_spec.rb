require 'morse_decoder.rb'

describe Morse_decoder do
  subject(:morse_decoder) { described_class }

  Morse_to_english_dictionary = {
    ".-"    => "A",
    "-..."  => "B",
    "-.-."  => "C",
    "-.."   => "D",
    "."     => "E",
    "..-."  => "F",
    "--."   => "G",
    "...."  => "H",
    ".."    => "I",
    ".---"  => "J",
    "-.-"   => "K",
    ".-.."  => "L",
    "--"    => "M",
    "-."    => "N",
    "---"   => "O",
    ".--."  => "P",
    "--.-"  => "Q",
    ".-."   => "R",
    "..."   => "S",
    "-"     => "T",
    "..-"   => "U",
    "...-"  => "V",
    ".--"   => "W",
    "-..-"  => "X",
    "-.--"  => "Y",
    "--.."  => "Z",
    "-----" => "0",
    ".----" => "1",
    "..---" => "2",
    "...--" => "3",
    "....-" => "4",
    "....." => "5",
    "-...." => "6",
    "--..." => "7",
    "---.." => "8",
    "----." => "9",
    ".-..." => "&",
    ".----."=> "'",
    ".--.-."=> "@",
    "-.--.-"=> ")",
    "-.--." => "(",
    "---..."=> ":",
    "--..--"=> ",",
    "-...-" => "=",
    "-.-.--"=> "!",
    ".-.-.-"=> ".",
    "-....-"=> "-",
    ".-.-." => "+",
    ".-..-."=> '"',
    "..--.."=> "?",
    "-..-." => "/"
  }

  it 'responds to morse_decoder' do
    expect(morse_decoder).to respond_to(:decode_morse).with(1).argument
  end
  it 'returns "A" when passed the string ".-"' do
    expect(morse_decoder.decode_morse('.-')).to eq('A')
  end
  it 'returns "B" when passed the string "-..."' do
    expect(morse_decoder.decode_morse('-...')).to eq('B')
  end
  it 'returns "C" when passed the string "-.-."' do
    expect(morse_decoder.decode_morse('-.-.')).to eq('C')
  end
  it 'returns the corresponding English character for any Morse character passed to it' do
    key = Morse_to_english_dictionary.keys.sample
    p "Test ran with randomly selected key: #{key}"
    value = Morse_to_english_dictionary[key]
    p "test ran with corresponding value: #{value}"
    expect(morse_decoder.decode_morse(key)).to eq(value)
  end
end
