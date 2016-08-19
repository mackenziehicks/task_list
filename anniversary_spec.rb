require 'rspec'
require_relative  'anniversary'
require 'pry'

describe Anniversary do
  it "is a thing" do
    expect{Anniversary.new("Mom's bday","send card", 2016,12,9)}.to_not raise_error
  end


# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
# Hint: Do not use Date to store the date.
#


# Story: As a developer, I can print an item for an anniversary with field labels and values.
#
 it "can print an item with field labels and values" do
   anniversary = Anniversary.new("Mom's bday","send card", 2016,12,9)
   expect(anniversary.anniversary_print).to eq "Title: Mom's bday Description: send card Status: incomplete Anniversary: 2016-12-9"
 end


end
