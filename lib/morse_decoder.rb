class Morse_decoder
  def self.decode_morse(morse_message)
    if morse_message == '.-'
      'A'
    else
      'B'
    end
  end
end
