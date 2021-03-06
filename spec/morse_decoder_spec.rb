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

  it 'responds to decode_morse' do
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
    it 'Raises an error if input is not valid Morse code' do
      expect { morse_decoder.decode_morse("..............") }.to raise_error("Unable to decode: input is not valid Morse code.")
    end
    context 'When input contains English character(s), number(s) or symbol(s)' do
      it 'Raises error "Unable to decode: input contains English character(s), number(s) or symbol(s)" if input contains English character(s)' do
        expect { morse_decoder.decode_morse("A") }.to raise_error("Unable to decode: input contains English character(s), number(s) or symbol(s)")
      end
      it 'Raises error "Unable to decode: input contains English character(s), number(s) or symbol(s)" if input contains numeral(s)' do
        expect { morse_decoder.decode_morse("1") }.to raise_error("Unable to decode: input contains English character(s), number(s) or symbol(s)")
      end
      it 'Raises error "Unable to decode: input contains English character(s), number(s) or symbol(s)" if input contains English symbol(s)' do
        expect { morse_decoder.decode_morse("?") }.to raise_error("Unable to decode: input contains English character(s), number(s) or symbol(s)")
      end
      it 'raises error "Unable to decode: input contains English character(s), number(s) or symbol(s)" even if input also contains dot(s) or dash(es)' do
        expect { morse_decoder.decode_morse("._.HELLO.-.") }.to raise_error("Unable to decode: input contains English character(s), number(s) or symbol(s)")
      end
      it 'raises error "Unable to decode: input contains English character(s), number(s) or symbol(s)" even if input also contains dot(s) or dash(es) and space(s)' do
        expect { morse_decoder.decode_morse(".-. HELLO .-.") }.to raise_error("Unable to decode: input contains English character(s), number(s) or symbol(s)")
      end
      it 'Raises error "Unable to decode: input contains English character(s), number(s) or symbol(s)" if input contains lower case English character(s)' do
        expect { morse_decoder.decode_morse("abc") }.to raise_error("Unable to decode: input contains English character(s), number(s) or symbol(s)")
      end
    end
    it 'Raises error "Nothing to decode: input is an empty string" if the input is an empty string' do
      expect { morse_decoder.decode_morse("") }.to raise_error("Nothing to decode: input is an empty string")
    end
  end
end
