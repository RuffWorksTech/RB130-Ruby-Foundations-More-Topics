# rubocop:disable Layout/LineLength

=begin
----------------------------PROMPT----------------------------------
Write a program that conforms to the above instructions and encrypts text strings with the following simple (and very unsecure) cipher:

- Replace each letter in the original string with another letter.
- The first letter of the alphabet should be replaced with the last.
- The second letter of the alphabet should be replaced with the next to last.
- The third letter of the alphabet should be replace with the second from the last.
- Continue on in this manner throughout the alphabet.
- For example, the word money gets encrypted as nlmvb.

-----------------------------INPUT----------------------------------
#encode method is given a single string that will contain one or more words

----------------------------OUTPUT----------------------------------
#encode method returns a single ciphered string

-----------------------------RULES----------------------------------
Explicit:
- First letter of the alphabet should be replaced with the last
- Second letter of the alphabet should be replaced with the next to last
- Third letter of the alphabet should be replaced with the second from the last

Implicit:
- If the letter is found in the second half of the alphabet, the replacement works in reverse
- All uppercase letters are treated as lowercase
- Spaces between letters are removed
- Return string will only have a string of characters 5 long max
- Numbers return as themselves
- Any other character is removed

-------------------------DATA STRUCTURES----------------------------
Store first half of alphabet as lowercase strings
Store second half of alphabet in reverse order as lowercase strings

----------------------------ALGORITHM-------------------------------
class Cipher
FIRST_HALF = first half of alphabetic characters
SECOND_HALF = second half of alphabetic characters in reverse order

#self.encode(single string)
  - Create empty string variable result
  - Split string into chars and iterate through
    - run #replace_char
  - Return result

#self.replace_char
  - If character is in first half array, replace with value of the same index from the second_half array
  - If character is in second half arrya, replace with value of the same index from the first_half array

=end

# rubocop:enable Layout/LineLength

class Cipher
  FIRST_HALF = Array('a'..'n')
  SECOND_HALF = Array('m'..'z').reverse

  def self.encode(str)
    result = ''
    str.downcase.chars.each { |char| result << replace_char(char) }
    # result.scan(/.{1,5}/).join(' ')
  end

  class << self
    private

    def replace_char(char)
      if FIRST_HALF.include?(char)
        SECOND_HALF[FIRST_HALF.find_index(char)]
      elsif SECOND_HALF.include?(char)
        FIRST_HALF[SECOND_HALF.find_index(char)]
      elsif ('0'..'9').include?(char)
        char
      else
        ''
      end
    end
  end
end

# p Cipher.encode('no')
# p Cipher.encode('yes')
# p Cipher.encode('OMG')
# p Cipher.encode('O M G')
# p Cipher.encode('mindblowingly') #== 'nrmwy oldrm tob'
# p Cipher.encode('Testing, 1 2 3, testing.')
# p Cipher.encode('The quick brown fox jumps over the lazy dog.')
