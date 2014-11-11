require 'pry'
require 'bigdecimal'

regex = /^([A-Z]{3}|[$]+|[A-Z]{2}[$])([0-9]+)(((\.[0-9]{2})|,[0-9]+|[k])?)+/


array = %w(
$$22.0000
GBP44,000hjg
AUD21k
EUR18500
THB10000000.000
RUP1999
dsdfgdfgdfgdfg2443435
$45,89897979.90
$98,000,000,000.00
FHJK89
hJK098.9
USD78
US$698
)


empty_array = []

array.each do |string|
  if string.match(regex)
    # puts string
    empty_array.push(string)

  end
end

# p empty_array

# empty_array.each do |string|

def dollar_convert(num)
  result = ((num * 1.16).round(2)).to_s
  p "$$" + num.to_s + " = $" + result
end

def gdb_convert(num)
  result = (num * 1.83).to_s
  p "GBP" + num.to_s + " = $" + result
end

def euro(num)
  result = (num * 1.44).to_s
  p "EURO" + num.to_s + "k" + " = $" + result 
end

def convert(array)
  array.each do |string|
    # if string.include?('k')
    #   num = string.scan(/[k]/).join('').to_i
    #   knum = num * 1000
    #   p knum.to_s

    if string.include?('GBP')
      num =  string.scan(/\d/).join('').to_i
      gdb_convert(num)
    elsif string.include?('$$')
      num = string.scan(/\d/).join('').to_i
      dollar_convert(num)
    elsif string.include?('USD$')
      string.gsub!(/USD[$]*/, 'USD')
      p string
    elsif string.include?('USD')
      string.gsub!(/[$]+USD/, 'USD')
      p string
    elsif string.include?('EUR')
     num =  string.scan(/\d/).join('').to_i

    elsif string.include?('EUR')
        num =  string.scan(/\d/).join('').to_i
           result = (num * 1.44).to_s
           p "EURO" + num.to_s + " = $" + result
    elsif string.include?('THB')
        num1 =  string.scan(/\d+\.[0-9]{2}/).join('').to_i
           result1 = ((num1 * 0.035).round(2)).to_s
           p "THB" + num1.to_s + " = $" + result1
    elsif string.include?('RUP')
        num =  string.scan(/\d/).join('').to_i
           result = ((num * 0.019).round(2)).to_s
           p "RUP" + num.to_s + " = $" + result
      elsif string.include?('k')
        num =  string.scan(/\d/).join('').to_i
           result = ((num * 1000).round(2)).to_s
           p num.to_s + "k" + " = $" + result
      end
  end

end



convert(empty_array)
# convert(array)
# binding.pry