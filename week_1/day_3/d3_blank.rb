#!/usr/bin/ruby
# frozen_string_literal: true

class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    size.zero?
  end
end

['', 'persona', nil].each do |el|
  puts el unless el.blank?
end
