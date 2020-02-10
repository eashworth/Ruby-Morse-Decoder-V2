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
    # raise_error if morse_message
    # How to detect not valid Morse? not in dictionary
    # Detect within decode_morse_character method
    # but what if just empty? Should just go to decode_morse_character
    if morse_message.include?("/")
      decode_morse_sentence(morse_message)
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
    raise "Unable to decode: input is not valid Morse code." if Morse_to_english_dictionary[morse_character] == nil
    Morse_to_english_dictionary[morse_character]
  end

  def self.decode_morse_word(morse_word)
    morse_word_split = morse_word.split(" ")
    english_word = morse_word_split.map do |morse_character|
      decode_morse_character(morse_character)
    end
    return english_word.join("")
  end

  def self.decode_morse_sentence(morse_message)
    morse_words = morse_message.split("/")
    english_words = morse_words.map do |morse_word|
      decode_morse_word(morse_word)
    end
    return english_words.join(" ")
  end

end
