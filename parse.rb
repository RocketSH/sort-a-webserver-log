require 'rspec/autorun'

class Log
  def parse(file)
    File.read(file)
  end
end

p Log.new.parse("webserver.log")

describe Log do
  fake_source = "/about/2 543.910.244.929\n/help_page/1 200.017.277.774\n/home 126.318.035.038\n/about/2 184.123.665.067\n/home 451.106.204.921\n/home 200.017.277.774\n/about/2 200.017.277.774\n/about 543.910.244.929\n"

  it "Count each page views" do
  end

  it "Sort page visits in descending order" do
  end
end
