require 'rspec'
require './parse.rb'

describe "Parse" do
  EXPECTED = [["/help_page/1", [4, 4]], ["/home", [3, 2]], ["/contact", [1, 1]], ["/about/2", [1, 1]], ["/index", [1, 1]], ["/about", [1, 1]]]

  subject { Parse.new(test_file).parse }
  let(:test_file) { ['test.log'] }
  
  before(:each) do
   @new_subject = subject.each { |el| el[1][1] = el[1][1].length }
  end

  it "Execute parse method" do
    subject
  end

  it "Each page in descending order" do
   sorted = @new_subject.sort_by { |k, v| -v[0] }
   expect(sorted).to eq EXPECTED
  end

  it "Each unique view in descending order" do
    sorted = @new_subject.sort_by { |k, v| -v[1] }
    expect(sorted).to eq EXPECTED
  end
end
