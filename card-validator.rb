# frozen_string_literal: true

# CardValidator
# Command line instructions: pass a file containing a list of card numbers to
# validate, one set of numbers per line e.g.
# `$ cardvalidator card-numbers.txt`
class CardValidator
  def initialize
    file = File.open(ARGV.first)
    @card_numbers = file.read
    puts "Card numbers"
    puts @card_numbers
  end

  def main

  end
end

CardValidator.new.main