# Evaluates poker hands for validity and determines the winning hand
class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
  end

  # Check a list of hands
  def hand_classifications
    @hands.map { |hand| self.class.hand_classification(hand) }
  end

  # Check the possible variations of a hand starting from the most valuable one
  def self.hand_classification(hand)
    poker_hand = PokerHand.new(hand)
    if poker_hand.royal_flush?
      'ROYAL_FLUSH'
    elsif poker_hand.straight_flush?
      'STRAIGHT_FLUSH'
    elsif poker_hand.four_of_a_kind?
      'FOUR_OF_A_KIND'
    elsif poker_hand.full_house?
      'FULL_HOUSE'
    elsif poker_hand.flush?
      'FLUSH'
    elsif poker_hand.straight?
      'STRAIGHT'
    elsif poker_hand.three_of_a_kind?
      'THREE_OF_A_KIND'
    elsif poker_hand.two_pair?
      'TWO_PAIR'
    elsif poker_hand.one_pair?
      'ONE_PAIR'
    else
      'HIGH_CARD'
    end
  end
end
