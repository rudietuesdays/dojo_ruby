require "spec_helper"

RSpec.describe Stringer do
  it "has a version number" do
    expect(Stringer::VERSION).not_to be nil
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end

  it "concatenates undefined number of strings with a space" do
    expect(Stringer.spacify "Oscar", "Vazquez", "Zweig", "Olasaba", "Hernandez", "Ricardo", "Mendoza").to eq(" Oscar Vazquez Zweig Olasaba Hernandez Ricardo Mendoza")
  end

  context "should have a method minify" do
    it 'requires a parameter of string and length' do
      expect{Stringer.minify()}.to raise_error(ArgumentError)
    end
    it 'follows the parameter of max length with the given string' do
      @stringer2 = Stringer.minify("Hello, I'm learning how to create a gem", 10)
      @stringer3 = Stringer.minify("Hello", 10)
      #if string has greater length than max length, shorten to max length and add '...' to end
      expect(@stringer2).to eq("Hello, I'm...")
      #if string is shorter than max length, return string
      expect(@stringer3).to eq("Hello")
    end
  end

  context "should have a method replacify" do
    it "requires parameter of original string, string to be replaced, new string" do
      expect{Stringer.replacify()}.to raise_error(ArgumentError)
    end
    it 'iterates over a string and replaces each instance of the word with the word provided' do
      stringer = Stringer.replacify("I can't do this", "can't", "can")
      expect(stringer).to eq("I can do this")
    end
  end

  context "should have a method tokenize" do
    it "requires parameter of a string" do
      expect{Stringer.tokenize()}.to raise_error(ArgumentError)
    end
    it "iterates over a string, adds each word to an array, returns the array" do
      stringer = Stringer.tokenize("I love to code")
      expect(stringer).to eq(["I", "love", "to", "code"])
    end
  end

  context "should have a method removify" do
    it "requires parameters of a string and a string to remove" do
      expect{Stringer.removify}.to raise_error(ArgumentError)
    end
    it "removes each instance of the second string within the original string" do
      stringer = Stringer.removify("I'm not a developer", "not ")
      expect(stringer).to eq("I'm a developer")
    end
  end

end
