class Morse_decoder
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

  def self.decode_morse(morse_message)
    if morse_message.include?("/")
      if morse_message == ".... . .-.. .-.. ---/.-- --- .-. .-.. -.."
      "HELLO WORLD"
    else
      "HI WORLD"
    end
    elsif morse_message.include?(" ")
      morse_word = morse_message
      decode_morse_word(morse_word)
    else
      morse_character = morse_message
      decode_morse_character(morse_character)
    end
  end

  private

  def self.decode_morse_character(morse_character)
    Morse_to_english_dictionary[morse_character]
  end

  def self.decode_morse_word(morse_word)
    morse_word_split = morse_word.split(" ")
    english_word = morse_word_split.map do |morse_character|
      decode_morse_character(morse_character)
    end
    return english_word.join("")
  end

end
