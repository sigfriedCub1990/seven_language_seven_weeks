#!/usr/bin/ruby
# frozen_string_literal: true

filename = ARGV[0]
regex = ARGV[1]

unless filename && regex
  puts 'Dummy grep implementation in Ruby'
  puts '---------------------------------'
  puts 'The usage is: grep filename regex'
  return
end

file = File.open(filename)
reg = Regexp.new(regex, 'i')

lines = file.readlines
lines.each_index do |idx|
  match = reg.match(lines[idx])
  puts "#{idx + 1}: #{lines[idx].lstrip}" if match
end
