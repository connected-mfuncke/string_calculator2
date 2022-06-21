require './src/roman_numerals'

class StringCalculator
  MAX_NUMBER_SIZE = 1000

  attr_reader :str

  def initialize input
    @str = input
  end

  def add
    return 0 if str.empty?
    return str.to_i unless delimeters_present?

    get_numbers.sum { |x| x.to_i }
  end

  private

  def delimeters_present?
    str.include?(',') || str.include?('\n')
  end

  def get_numbers
    ints = Delimiter.construct(str).split
    # TODO - extract this into an injected dependency
    converter = RomanNumerals.new
    ints = ints.map { |x| converter.roman?(x) ? converter.roman_to_int(x) : x }
    validate_input ints

    ints.filter { |i| i.to_i <= MAX_NUMBER_SIZE }
  end

  def validate_input ints
    negatives = ints.filter { |i| i.to_i < 0 }
    raise StandardError, "negatives not allowed: #{negatives.join(',')}" if negatives.length > 0
  end

  class Delimiter
    def initialize(str)
      @str = str
    end

    def split
      @str.split(/[\\n,]/)
    end

    def self.construct(str)
      if str.include?('//')
        CustomDelimiter.new str
      else
        Delimiter.new str
      end
    end
  end

  class CustomDelimiter < Delimiter
    def split
      head, tail = @str.split('\n')
      delimiter = head.sub('//', '')
      tail.split(delimiter)
    end
  end
end
