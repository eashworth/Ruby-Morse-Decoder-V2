class Morse_validator
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

  private

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
end
