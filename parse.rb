require 'rspec/autorun'

class Log
  def parse(file)
    counts = {}
    File.open(file).each_line do |line|
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

Log.new.parse("webserver.log")

describe "Parse" do
  EXPECTED = [["/help_page/1", 4],
 ["/home", 2],
 ["/contact", 1],
 ["/about/2", 1],
 ["/index", 1],
 ["/about", 1]]

  it "Elements in descending order" do
    fake_source = "fake.log"
    actual = Log.new.parse(fake_source)

    elem_0 = actual[0][1]
    elem_1 = actual[1][1]

    expect(actual).to eq EXPECTED
  end
end
