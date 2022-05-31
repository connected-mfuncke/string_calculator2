class StringCalculator
  MAX_NUMBER_SIZE = 1000
  def add(str)
    return 0 if str.empty?
    # TODO - extract str into StringCalculator attribute
    return str.to_i unless delimeters_present? str

    get_numbers(str).sum { |x| x.to_i }
  end

  private

  def delimeters_present? str
    str.include?(',') || str.include?('\n')
  end

  def get_numbers str
    ints = Delimiter.construct(str).split
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
