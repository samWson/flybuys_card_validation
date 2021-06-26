# frozen_string_literal: true

require 'minitest/autorun'
require './card-identifier.rb'

class CardIdentifierTest < MiniTest::Unit::TestCase
  def it_identifies_16_digit_black_cards
    card_identifier = CardIdentifier.new(6014100000000000)

    assert_equal CardIdentifier::BLACK, card_identifier.identify
  end

  def it_identifies_17_digit_black_cards
    card_identifier = CardIdentifier.new(60141000000000000)

    assert_equal CardIdentifier::BLACK, card_identifier.identify
  end

  def it_does_not_identify_15_digit_cards
    card_identifier = CardIdentifier.new(601410000000000)

    assert_equal CardIdentifier::UNKNOWN, card_identifier.identify
  end

  def it_does_not_identify_18_digit_cards
    card_identifier = CardIdentifier.new(601410000000000000)
    
    assert_equal CardIdentifier::UNKNOWN, card_identifier.identify
  end
end