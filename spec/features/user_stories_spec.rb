describe 'User stories' do
  # User story 1:
  # As an English speaker
  # So I can begin understanding Morse code
  # I would like to translate any single Morse code character to English
  it 'Translates a single Morse code character to English' do
    expect { Morse_decoder.decode_morse(".-") }.not_to raise_error
    expect(Morse_decoder.decode_morse('.-')).to eq('A')
  end
  it 'Translates a second Morse code character to English' do
    expect(Morse_decoder.decode_morse('-...')).to eq('B')
  end
  it 'Translates a third Morse code character to English' do
    expect(Morse_decoder.decode_morse('-.-.')).to eq('C')
  end

  # User story 2:
  # As an English speaker
  # So I can understand words in Morse code
  # I would like to translate a word in Morse code to English
  it 'Translates a word in Morse code' do
    expect(Morse_decoder.decode_morse('.- .- .-')).to eq('AAA')
  end
  it 'Translates a second word in Morse code' do
    expect(Morse_decoder.decode_morse('.- -... -...')).to eq('ABB')
  end
  it 'Translates a third word in Morse code' do
    expect(Morse_decoder.decode_morse('.- -... -.-.')).to eq('ABC')
  end

  # User story 3:
  # As an English speaker
  # So I can understand a sentence in Morse code
  # I would like to translate a sentence in Morse code to English
  it 'Translates a sentence in Morse code' do
    expect(Morse_decoder.decode_morse(".... . .-.. .-.. ---/.-- --- .-. .-.. -..")).to eq('HELLO WORLD')
  end
  it 'Translates a second sentence in Morse code' do
    expect(Morse_decoder.decode_morse(".... ../.-- --- .-. .-.. -..")).to eq('HI WORLD')
  end
  it 'Translates a third sentence in Morse code' do
    expect(Morse_decoder.decode_morse(".... ../.... ---")).to eq('HI HO')
  end

  # User story 4:
  # As an English speaker
  # So I can identify whether a message is in Morse code
  # I want to be told if the message input is not valid Morse code
  it 'Raises an error if input is not valid Morse code' do
    expect { Morse_decoder.decode_morse("..............") }.to raise_error
  end

  # User story 5:
  # As an English speaker
  # So I can identify whether a message is in Morse code
  # I want to be told if the message input contains English character(s), number(s) or symbol(s)
  it 'Raises error "Unable to decode: input contains English character(s), number(s) or symbol(s)" if input contains English character(s), number(s) or symbol(s)' do
    expect { Morse_decoder.decode_morse("A") }.to raise_error("Unable to decode: input contains English character(s), number(s) or symbol(s)")
  end

  # User story 6:
  # As an English speaker
  # So I can remember to provide an input message
  # I want to be told if the input message is an empty string
  it 'Raises error "Nothing to decode: input is an empty string" if the input is an empty string' do
    expect { Morse_decoder.decode_morse("") }.to raise_error("Nothing to decode: input is an empty string")
  end
end
