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
  class EmptyStringError < StandardError
    def message
      "Nothing to decode: input is an empty string"
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
    if morse_sentence?(morse_message)
      decode_morse_sentence(morse_message)
    elsif morse_word?(morse_message)
      decode_morse_word(morse_message)
    else
      decode_morse_character(morse_message)
    end
  end

  private

  def self.morse_sentence?(morse_message)
    morse_message.include?("/")
  end

  def self.morse_word?(morse_message)
    morse_message.include?(" ")
  end

  def self.decode_morse_character(morse_character)
    validate_character(morse_character)
    Morse_to_english_dictionary[morse_character]
  end

  def self.validate_character(morse_character)
    raise EnglishInputError if english_input?(morse_character)
    raise InvalidMorseError if invalid_morse?(morse_character)
    raise EmptyStringError if string_input_empty?(morse_character)
  end

  def self.english_input?(morse_character)
    morse_character.upcase =~ /[A-Z, 0-9, \\?&'@)(:,=!+]/
  end

  def self.invalid_morse?(morse_character)
    (morse_character.include?(".") || morse_character.include?("-")) &&
      Morse_to_english_dictionary[morse_character] == nil
  end

  def self.string_input_empty?(morse_character)
    Morse_to_english_dictionary[morse_character] == nil
  end

  def self.decode_morse_word(morse_word)
    split_morse_word = morse_word.split(" ")
    split_english_word = split_morse_word.map do |morse_character|
      decode_morse_character(morse_character)
    end
    return split_english_word.join("")
  end

  def self.decode_morse_sentence(morse_message)
    split_morse_sentence = morse_message.split("/")
    split_english_sentence = split_morse_sentence.map do |morse_word|
      decode_morse_word(morse_word)
    end
    return split_english_sentence.join(" ")
  end

end
