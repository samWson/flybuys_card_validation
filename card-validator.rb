# frozen_string_literal: true

require './card-identifier.rb'

# CardValidator
# Command line instructions: pass a file containing a list of card numbers to
# validate, one set of numbers per line e.g.
# `$ cardvalidator card-numbers.txt`
class CardValidator
  def initialize
    file = File.open(ARGV.first)
    @card_numbers = file.read
  end

  def main
    identified_cards = @card_numbers.split(/\n/).map do |number|
      CardIdentifier.new(number).identify
    end

    identified_cards.each do |card|
      puts card
    end
  end
end

CardValidator.new.main