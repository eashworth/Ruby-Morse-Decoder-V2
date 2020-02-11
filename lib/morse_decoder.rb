require_relative 'morse_validator'

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
    Morse_validator.validate_character(morse_character)
    Morse_to_english_dictionary[morse_character]
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
