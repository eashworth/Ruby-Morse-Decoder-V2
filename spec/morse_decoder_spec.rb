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
  describe '#decode_morse' do
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
    it 'returns "AAA" when passed the string ".- .- .-"' do
      expect(morse_decoder.decode_morse('.- .- .-')).to eq('AAA')
    end
    it 'returns "ABB" when passed the string ".- -... -..."' do
      expect(morse_decoder.decode_morse('.- -... -...')).to eq('ABB')
    end
    it 'returns "ABC" when passed the string ".- -... -.-."' do
      expect(morse_decoder.decode_morse('.- -... -.-.')).to eq('ABC')
    end
    it "returns '&'@)(:,=!.-+?/' when passed the string '.-... .----. .--.-. -.--.- -.--. ---... --..-- -...- -.-.-- .-.-.- -....- .-.-. ..--.. -..-.'" do
      expect(morse_decoder.decode_morse(".-... .----. .--.-. -.--.- -.--. ---... --..-- -...- -.-.-- .-.-.- -....- .-.-. ..--.. -..-.")).to eq("&'@)(:,=!.-+?/")
    end
    it "returns '1234567890' when passed the string '.---- ..--- ...-- ....- ..... -.... --... ---.. ----. -----'" do
      expect(morse_decoder.decode_morse(".---- ..--- ...-- ....- ..... -.... --... ---.. ----. -----")).to eq("1234567890")
    end
    it 'Translates a randomly-generated word in Morse code' do
      key1 = Morse_to_english_dictionary.keys.sample
      key2 = Morse_to_english_dictionary.keys.sample
      key3 = Morse_to_english_dictionary.keys.sample
      value1 = Morse_to_english_dictionary[key1]
      value2 = Morse_to_english_dictionary[key2]
      value3 = Morse_to_english_dictionary[key3]
      random_morse_word = "#{key1} #{key2} #{key3}"
      corresponding_english_word = "#{value1}#{value2}#{value3}"
      p "Test ran with randomly-generated Morse word: #{random_morse_word}"
      p "Corresponding English word: #{corresponding_english_word}"
      expect(morse_decoder.decode_morse("#{random_morse_word}")).to eq("#{corresponding_english_word}")
    end
    it "returns 'HELLO WORLD' when passed the string '.... . .-.. .-.. ---/.-- --- .-. .-.. -..'" do
      expect(morse_decoder.decode_morse(".... . .-.. .-.. ---/.-- --- .-. .-.. -..")).to eq('HELLO WORLD')
    end
    it "returns 'HI WORLD' when passed the string '.... ../.-- --- .-. .-.. -..'" do
      expect(morse_decoder.decode_morse(".... ../.-- --- .-. .-.. -..")).to eq('HI WORLD')
    end
    it "returns 'HI HO' when passed the string '.... ../.... ---'" do
      expect(morse_decoder.decode_morse(".... ../.... ---")).to eq('HI HO')
    end
  end
end
