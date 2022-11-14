#!/usr/bin/env ruby
if ARGV.length != 1
    puts "We need exactly one parameter. The name of a file."
    exit;
end
 
filename = ARGV[0]
puts "Going to open '#{filename}'"
file = open filename

require 'rspec'

class Log
  def parse(content)
    counts = {}
    content.each_line do |line|
      page, _ = line.split

      # Count each webpage views
      if counts[page]
        counts[page] += 1
      else
        counts[page] = 1
      end
    end
    # Sort page visits in descending order
    counts.sort_by { |k, v| -v }
  end
end

result = Log.new.parse(file)
puts result

