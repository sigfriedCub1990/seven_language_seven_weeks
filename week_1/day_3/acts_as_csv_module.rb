# frozen_string_literal: true

# Represents a CSV Row
class CsvRow
  attr_reader :fields, :headers

  def initialize(args, headers)
    @fields = []
    @headers = headers
    args.each do |field|
      fields << field
    end
  end

  def return_field(column_name)
    idx = headers.index column_name
    if !idx.nil?
      fields[idx]
    else
      "Supported fields are: #{headers}"
    end
  end

  def method_missing(methd_id)
    str = methd_id.to_s
    return_field(str)
  end

  def respond_to_missing?
    true
  end
end

# Metaprogramming example
module ActAsCsv
  # When ActAsCsv is included in RubyCsv
  # this method is called and the methods
  # defined in ClassMethods are added to RubyCsv.
  def self.included(base)
    base.extend ClassMethods
  end

  # Methods defined in this module will be
  # included in RubyCsv. This make it possible
  # to call `act_as_csv` function in RubyCsv.
  module ClassMethods
    def act_as_csv
      include InstanceMethods
    end
  end

  # Instance methods are the methods you can
  # call on a class instance.
  #
  # My take on this is that when this module is
  # included the by ClassMethods::act_as_csv the
  # initialize and read methods are added to RubyCsv,
  # this allows us to do RubyCsv.new and do the work.
  module InstanceMethods
    def read
      @csv_contents = []
      file = File.new("#{self.class.to_s.downcase}.txt")
      @headers = file.gets.chomp.split(',')

      file.each do |row|
        csv_row = CsvRow.new(row.chomp.split(','), @headers)
        @csv_contents << csv_row
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each(&block)
      @csv_contents.each { |row| block.call row }
    end
  end
end

# Dummy "metaprogrammed" class.
class RubyCsv
  include ActAsCsv
  act_as_csv
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect
m.each { |row| puts "#{row.app} - #{row.description}" }
