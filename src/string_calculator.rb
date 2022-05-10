class StringCalculator
  def add(str)
    return 0 if str.empty?
    return str.to_i unless str.include?(',') || str.include?('\n')

    ints = Delimiter.splitIntoSubStrings(str).split

    negatives = ints.filter { |i| i.to_i < 0 }
    raise StandardError, "negatives not allowed: #{negatives.join(',')}" if negatives.length > 0

    ints.filter { |i| i.to_i <= 1000 }.sum { |x| x.to_i }
  end

  private

  class Delimiter
    def initialize(str)
      @str = str
    end

    def self.splitIntoSubStrings(str)
      if str.include?('//')
        CustomDelimiter.new
      else
        DefaultDelimiter.new
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

  class DefaultDelimiter < Delimiter
    def split
      @str.split(/[\\n,]/)
    end
  end
end
