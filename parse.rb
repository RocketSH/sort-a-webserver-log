require 'rspec/autorun'

class Log
  def parse(file)
    result = {}
    File.read(file).each_line do |line|
      page, _ = line.split

      if result[page]
        result[page] += 1
      else
        result[page] = 1
      end
    end
    result
  end
end

Log.new.parse("webserver.log")

describe "Parse" do
  FAKE_SOURCE = """
  /about/2 543.910.244.929
  /help_page/1 200.017.277.774
  /home 126.318.035.038
  /about/2 184.123.665.067
  /home 451.106.204.921
  /home 200.017.277.774
  /about/2 200.017.277.774
  /about 543.910.244.929
  """.strip.freeze

  it "Counts and sort each page views" do
  end
end
