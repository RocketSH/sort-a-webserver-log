require 'rspec'
require './parse.rb'

describe "Parse" do
  EXPECTED = [["/help_page/1", 4],
 ["/home", 2],
 ["/contact", 1],
 ["/about/2", 1],
 ["/index", 1],
 ["/about", 1]]

  ACTUAL_SOURE = """
    /help_page/1 126.318.035.038
    /contact 184.123.665.067
    /home 184.123.665.067
    /about/2 444.701.448.104
    /help_page/1 929.398.951.889
    /index 444.701.448.104
    /help_page/1 722.247.931.582
    /about 061.945.150.735
    /help_page/1 646.865.545.408
    /home 235.313.352.950
  """.strip.freeze

  it "Elements in descending order" do
    actual = Log.new.parse(ACTUAL_SOURE)

    elem_0 = actual[0][1]
    elem_1 = actual[1][1]

    expect(actual).to eq EXPECTED
  end
end
