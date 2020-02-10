class Morse_decoder
  class InvalidMorseError < StandardError
    def message
      "Unable to decode: input is not valid Morse code."
    end
  end
  class EnglishInputError < StandardError
    def message
      "Unable to decode: input contains English character(s), number(s) or symbol(s)"
    end
  end

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
    if morse_character.upcase =~ /[A-Z, 0-9, \\?&'@)(:,=!+]/
      raise EnglishInputError
    elsif (morse_character.include?(".") || morse_character.include?("-")) &&
      Morse_to_english_dictionary[morse_character] == nil
      raise InvalidMorseError
    elsif Morse_to_english_dictionary[morse_character] == nil
      raise "Nothing to decode: input is an empty string"
    else
      Morse_to_english_dictionary[morse_character]
    end
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
