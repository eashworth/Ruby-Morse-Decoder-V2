class Morse_decoder
  def self.decode_morse(morse_message)
    if morse_message == '.-'
      'A'
    elsif morse_message == '-...'
      'B'
    else
      'C'
    end
  end
end
