# Ruby Morse Decoder 2

Version 2 of my Morse code string parser written in Ruby - with the following improvements:

### Better TDD, and appropriate use of public/private methods

When writing tests for Version 1 of the Morse Decoder, I tried to anticipate the various methods that would be called within the decoding process, writing tests that called them directly. This meant I could not make them private. In V2 all of my tests call a single public method, which in turn calls various private methods. Thus the private methods do not require separate unit tests.

### Application of the Single Responsibility Principle

V1 of the Decoder relied on a single class, Morse_decoder, to perform all functions, including validating input. V2 performs more thorough validation of input, and does this using a separate Morse_validator class.

### Better abstraction = improved readability

In V2, several of the methods used in V1 have been refactored into smaller, more readable ones.

## International Morse code

International Morse Code represents each letter of the English alphabet with a unique combination of short and long audible tones, phonetically described as "dit" and "dah", with a long tone being three times the length of a short one.

A silence equivalent in length to one 'dit' is used between the components of a letter, with a longer silence, equivalent to three "dits", used to denote a space between letters. A silence equivalent to seven "dits" is used to separate words.

Morse code does not distinguish between upper and lower case letters.

### Writing Morse Code

"Dit" and "dah" can be written as a dot or a dash (. or -) respectively. The English alphabet plus the numbers 0-9 are written as follows:

<image src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/International_Morse_Code.svg/473px-International_Morse_Code.svg.png">

Some common punctuation marks are written as follows:
```
& .-...
' .----.
@ .--.-.
) -.--.-
( -.--.
: ---...
, --..--
= -...-
! -.-.--
. .-.-.-
- -....-
+ .-.-.
" .-..-.
? ..--..
/ -..-.
```

### Spacing between written characters and words

The components of a letter are typed without any spaces inserted between them. Letters are separated by a single space (" ") and words are separated by a forward slash ("/"). The string "HELLO WORLD" is written as follows:

```
".... . .-.. .-.. ---/.-- --- .-. .-.. -.."
```

### What this program does

The Morse_decoder class takes an input in the form of a string containing a Morse code message and returns the English translation as a string of upper-case letters.

This program is able to decode each of the English alphabet's 26 letters, plus the numbers 0-9 and the common punctuation marks, as shown in the two dictionaries above.

Morse operators use a number of standard abbreviations, (e.g. "ADS" for address) and procedure signs (prosigns) (e.g. "SOS" for distress). These may be sent with the letters spaced as in a normal word, in which case the program will simply output the combination of letters, leaving the user to determine the meaning.

### What this program does not do

In some cases, abbreviations and prosigns are sent as two or more letters in immediate succession, without the spacing that normally defines letter boundaries, resulting in more than one potential combination of letters. In such cases, context and convention typically determine the letter boundaries and therefore the prosign being used. This program will not translate unspaced letter combinations - such input will instead result in an error.
