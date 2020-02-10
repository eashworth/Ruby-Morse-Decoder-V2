describe 'User stories' do
  # User story 1:
  # As an English speaker
  # So I can begin understanding Morse code
  # I would like to translate any single Morse code character to English
  it 'Translate a single Morse code character to English' do
    expect { Morse_decoder.decode_morse(".-") }.not_to raise_error
    expect(Morse_decoder.decode_morse('.-')).to eq('A')
  end
end
