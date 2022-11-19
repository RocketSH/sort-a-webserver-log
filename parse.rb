#!/usr/bin/env ruby
require 'set'

if ARGV.length != 1
    puts "We need exactly one parameter. The name of a file."
    exit;
end
 
filename = ARGV[0]
puts "Going to open '#{filename}'"
file = open filename

class Log
  def parse(content)
    counts = {}
    content.each_line do |line|
      url, ip = line.split

      # Count visits and unique views of each page
      # {"url": [visits, unique_views]}
      if counts[url]
        counts[url][0] += 1
        counts[url][1].add(ip)
      else
        counts[url] = [1, Set[ip]]
      end
    end
    # Sort page visits in descending order
    sorted = counts.sort_by { |k, v| -v[0] }
    # Print the result
    sorted.each do |k, v|
      puts "#{k} has #{v[0]} visits and #{v[1].length} unique views."
    end
  end
end

Log.new.parse(file)

