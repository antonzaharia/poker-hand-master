# A class that extracts the different values of a poker card
class Card
  def initialize(card)
    @value = card[0]
    @suit = card[1]
  end

  attr_reader :value, :suit
end
