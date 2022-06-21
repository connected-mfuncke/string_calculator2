# 1. An empty string returns zero `'' => 0`
# 2. A single number returns the value `'1' => 1` `'2' => 2`
# 3. Two numbers, comma delimited, returns the sum `'1,2' => 3` `'10,20' => 30`
# 4. Two numbers, newline delimited, returns the sum `'1\n2' => 3`
# 5. Three numbers, delimited either way, returns the sum `'1\n2,3\n4' => 10`
# 6. Negative numbers throw an exception with the message `'-1,2,-3' => 'negatives not allowed: -1,-3'`
# 7. Numbers greater than 1000 are ignored
# 8. A single char delimiter can be defined on the first line starting with `//` (e.g `//#\n1#2` for a ‘#’ as the delimiter)
# 9. A multi char delimiter can be defined on the first line starting with `//` (e.g. `//###\n1###2` for ‘###’ as the delimiter)
# 10. accept roman numerals as input
# 11. accept roman numerals as output

require './src/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it 'should return 0 when given an empty string' do
    result = StringCalculator.new('').add

    expect(result).to eq(0)
  end

  it 'should return the number when given a single nimber' do
    result = StringCalculator.new('1').add

    expect(result).to eq(1)
  end

  it 'should return the sum when given 2 integers separated by a comma' do
    result = StringCalculator.new('1,2').add

    expect(result).to eq(3)
  end

  it 'should return the sum when given 2 numbers and a newline as delimiter' do
    result = StringCalculator.new('1\n2').add
    expect(result).to eq(3)
  end

  it 'should return the sum when numbers are delimited by comma and/or newline' do
    result = StringCalculator.new('1\n2,3\n4').add
    expect(result).to eq(10)
  end

  it 'should throw an exception when negative numbers are used' do
    expect {
      StringCalculator.new('-1,2,-3').add
    }.to raise_error('negatives not allowed: -1,-3')
  end

  it 'should ignore any numbers greater than 1000' do
    result = StringCalculator.new('2,3,1001').add
    expect(result).to eq(5)
  end

  it 'should use a custom delimiter' do
    result = StringCalculator.new('//#\n1#2').add
    expect(result).to eq(3)
  end

  it 'should use a complicated delimiter' do
    result = StringCalculator.new('//###\n1###2').add
    expect(result).to eq(3)
  end

  describe 'roman numerals' do
    it 'should return 3 when given I and II' do
      expect(StringCalculator.new('I,II').add).to eq(3)
    end

    it 'should return III when given 1 and 2' do
      expect(StringCalculator.new('1,2').add).to eq('III')
    end
  end
end
