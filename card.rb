# A class that extracts the different values of a poker card
class Card
  class InvalidCardError < StandardError; end

  def initialize(card)
    raise InvalidCardError unless ['H', 'S', 'D', 'C'].include?(card[1])
    raise InvalidCardError if card[0] == 1

    @value = card[0]
    @suit = card[1]
  end

  attr_reader :suit

  VALUES = {
    J: 11,
    Q: 12,
    K: 13,
    A: 14
  }

  # Transforms the value in an integer
  def value
    if numeric?
      numeric_value
    else
      VALUES[@value.to_sym]
    end
  end

  # Checks if the value is a number or not
  def numeric?
    Integer(@value) && true
  rescue
    false
  end

  # Returns only the numeric value as an integer and in case of the value being 0, it returns 10
  def numeric_value
    return 10 if @value.to_i == 0
    @value.to_i
  end

  # Returns a raw format of the card
  def raw_format
    "#{@value}#{@suit}"
  end

end
