# frozen_string_literal: true

# Roman numerals representation
class Roman
  def self.method_missing name, *_args
    roman = name.to_s
    roman.gsub!('IV', 'IIII')
    roman.gsub!('IX', 'VIIII')
    roman.gsub!('XL', 'XXXX')
    roman.gsub!('XC', 'LXXXX')

    (roman.count('I') +
      roman.count('V') * 5 +
      roman.count('X') * 10 +
      roman.count('L') * 50 +
      roman.count('C') * 100
    )
  end
end

puts Roman.II
puts Roman.IV
puts Roman.X
puts Roman.XC
puts Roman.XII
puts Roman.X
