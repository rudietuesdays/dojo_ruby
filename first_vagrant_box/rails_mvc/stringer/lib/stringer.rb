require "stringer/version"

module Stringer
  def self.spacify *strings
    string = ""
    strings.each do |s|
      string += " " + s
    end
  string
  end

  def self.minify string, max_length
    if string.length > max_length
      string = string[0...(max_length)]
      string += "..."
    else
      string
    end
  end

  def self.replacify string, removable, new
    if string.include? removable
      string.sub! removable, new
    end
  end

  def self.tokenize string
    array = Array.new
    string.split(" ")
  end

  def self.removify string, word
    if string.include? word
      string.slice! word
      string
    end
  end

end
