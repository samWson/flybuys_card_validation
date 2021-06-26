# frozen_string_literal: true

# CardIdentifier
# Identifies flybuys cards from their numbers.
class CardIdentifier
  PREFIXES = {
    'Black' => '60141',
    'Red =>' => '6014352',
    'Green_a' => '6014355526',
    'Green_b' => '6014355529',
    'Blue' => '6014'
  }

  def initialize(number)
    @number = number
  end

  def identify
    identified_card = ''
    
    PREFIXES.each do |key, value|
      if @number.start_with?(value)
        identified_card = "Fly Buys #{key}: #{@number}"
      end
    end

    identified_card
  end
end