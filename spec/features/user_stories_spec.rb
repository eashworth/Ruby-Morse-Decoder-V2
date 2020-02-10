describe 'User stories' do
  # User story 1:
  # As an English speaker
  # So I can begin understanding Morse code
  # I would like to translate any single Morse code character to English
  it 'Translates a single Morse code character to English' do
    expect { Morse_decoder.decode_morse(".-") }.not_to raise_error
    expect(Morse_decoder.decode_morse('.-')).to eq('A')
  end
  it 'Translates a different Morse code character to English' do
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
  it 'Translates a different word in Morse code' do
    expect(Morse_decoder.decode_morse('.- -... -...')).to eq('ABB')
  end
end
