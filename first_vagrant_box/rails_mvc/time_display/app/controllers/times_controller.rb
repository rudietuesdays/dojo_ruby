require 'date'

class TimesController < ApplicationController
  def main
    @present = Time.new
  end
end
