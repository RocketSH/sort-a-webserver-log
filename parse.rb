#!/usr/bin/env ruby
require 'set'

class Parse
  attr_accessor :filename
  
  def initialize(argv)
    @filename = argv[0]
    puts "Going to open '#{@filename}'"
  end

  def parse
    file = open @filename
    counts = {}

    file.each_line do |line|
      url, ip = line.split

      # Count visits and unique views of each url
      # {"url": [visits, unique_views]}
      if counts[url]
        counts[url][0] += 1
        counts[url][1].add(ip)
      else
        counts[url] = [1, Set[ip]]
      end
    end

    # Print the page visits result
    sorted_visits = counts.sort_by { |k, v| -v[0] }
    sorted_visits.each do |k, v|
      puts "#{k} has #{v[0]} visits."
    end

    # Print the unique views result
    unique_views = counts.sort_by { |k, v| -v[1].length }
    unique_views.each do |k, v|
      puts "  #{k} has #{v[1].length} unique views."
    end
  end
end

if ARGV.length != 1
  puts "We need exactly one parameter. The name of a file."
  exit;
elsif ARGV[0] == 'parse_spec.rb'
  ARGV[0] = 'test.log'
else
  Parse.new(ARGV).parse
end
 
