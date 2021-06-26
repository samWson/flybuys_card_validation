# frozen_string_literal: true

# CardIdentifier
# Identifies flybuys cards from their numbers.
class CardIdentifier
  PREFIXES = {
    'Black' => '60141',
    'Red' => '6014352',
    'Green_a' => '6014355526',
    'Green_b' => '6014355529',
    'Blue' => '6014'
  }

  # A pipeline of methods to be run against the card in order. The card will be identified with the first that returns true.
  CARD_IDENTIFIERS = %w[identify_black identify_red identify_green identify_blue]

  def initialize(number)
    @number = number
  end

  def identify
    identified_as = CARD_IDENTIFIERS.detect do |identifier|
      self.send(identifier)
    end 

    case identified_as
    when 'identify_black'
      "Fly buys Black: #{@number}"
    when 'identify_red'
      "Fly buys Red: #{@number}"
    when 'idenfity_green'
      "Fly buys Green: #{@number}"
    when 'identify_blue'
      "Fly buys Blue: #{@number}"
    else
      "Unknown: #{@number}"
    end
  end

  private

  def identify_black
    @number.start_with?(PREFIXES['Black']) && (@number.size == 16 || @number.size == 17) 
  end

  def identify_red
    @number.start_with?(PREFIXES['Red']) && @number.size == 16
  end

  def identify_green
    (@number.start_with?(PREFIXES['Green_a']) || @number.start_with?(PREFIXES['Green_b'])) && @number.size == 16
  end

  def identify_blue
    @number.start_with?(PREFIXES['Blue']) && @number.size == 16
  end
end