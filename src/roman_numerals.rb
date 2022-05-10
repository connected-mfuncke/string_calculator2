class RomanNumerals
  # NOTE: added 4,40,400 as a way to avoid subtraction AND addition
  # They are NOT wired up to any tests.
  INTEGER_TO_NUMERALS = [
    [1000, 'M'],
    [900 ,'CM'],
    [500, 'D'],
    [400 ,'CD'],
    [100, 'C'],
    [90, 'XC'],
    [50, 'L'],
    [40 ,'XL'],
    [10, 'X'],
    [9 ,'IX'],
    [5, 'V'],
    [4 ,'IV'],
    [1, 'I']]

  #  modern vs. classic -- the former allows for a simpler conversion, potentially, as:
  # 1. a cleaner mapping from integers to numerals
  # 2. eliminates ambiguity, i.e. exactly one way to numeralize any given integer.

  def self.int_to_roman input
    output_numerals = ""

    temp = input
    INTEGER_TO_NUMERALS.each do |integer, numeral|
      number_of_numeral = temp / integer
      output_numerals = output_numerals + numeral * number_of_numeral

      temp -= number_of_numeral*integer
    end

    output_numerals
  end

  ROMAN_NUMERALS = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }.freeze

  # algorithm from stackoverflow http://......
  def self.roman_to_int(num)
    total = 0

    chars = num.split('')
    chars.each_with_index do |x, i|
      total += calculate(x, chars[i + 1])
    end

    total
  end

  def self.subtractive?(next_val, current_val)
    ROMAN_NUMERALS[next_val] && ROMAN_NUMERALS[current_val] < ROMAN_NUMERALS[next_val]
  end

  def self.calculate(val, next_val)
    subtractive?(next_val, val) ? ROMAN_NUMERALS[val] * -1 : ROMAN_NUMERALS[val]
  end
end
