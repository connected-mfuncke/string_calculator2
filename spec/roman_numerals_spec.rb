require './src/roman_numerals.rb'

RSpec.describe 'RomanNumerals' do
  subject { RomanNumerals.new }

  describe '.int_to_roman' do
    {
      1 => 'I',
      5 => 'V',
      10 => 'X',
      50 => 'L',
      100 => 'C',
      500 => 'D',
      1000 => 'M',
    }.each do |number, expected_numeral|
      it "Given the number #{number} return #{expected_numeral}" do
        result = subject.int_to_roman(number)

        expect(result).to eq expected_numeral
      end
    end

    it "Given the number 1666 return MDCLXVI" do
      expect(subject.int_to_roman(1666)).to eq 'MDCLXVI'
    end

    it "Given the number 28 return XXVIII" do
      expect(subject.int_to_roman(28)).to eq 'XXVIII'
    end

    {
      4 => 'IV',
      9 => 'IX',
      40 => 'XL',
      400 => 'CD',
    }.each do |number, expected_numeral|
      it "Given the number #{number} return #{expected_numeral}" do
        expect(subject.int_to_roman(number)).to eq expected_numeral
      end
    end

    # Does this cover all subtractive cases being mixed? (NO)
    it "Given the number 999 return CMXCIX" do
      expect(subject.int_to_roman(999)).to eq 'CMXCIX'
    end

    # We need a subtractive-additive mixture-test eg: CMXCVI
    it "Should return roman numberal CMXCVI when given integer 996" do
      expect(subject.int_to_roman(996)).to eq "CMXCVI"
    end
  end

  describe '.roman_to_int' do
    # One
    it 'Should return 1 when given the numeral I' do
      expect(subject.roman_to_int('I')).to eq 1
    end
    # Some
    it 'should return 2 when given II' do
      expect(subject.roman_to_int('II')).to eq(2)
    end
    # Many
    # MDCLXVI    # 1666

    # None
    # Oops
  end

  describe '.roman?' do
    it 'Should return true when given a roman numeral' do
      expect(subject.roman?('I')).to eq true
      expect(subject.roman?('II')).to eq true
      expect(subject.roman?('MCVII')).to eq true
    end

    it 'Should return false when given an integer' do
      expect(subject.roman?('6')).to eq false
      expect(subject.roman?('I6M')).to eq false
    end
  end
end















# YouTube Gem

# class StreamingPlatformFacade
#  def initialize(streaming_platform)
#   def send_message()
#     YouTubeApi.send
#   end

#   def receive_message()
#   end
# end

# class YouTubeApi << StreamingPlatform
#   def send()
#   end
# end

# class YouTubeMapper
#   def to_youtube
#   end

#   def from_youtube
#   end
# end
