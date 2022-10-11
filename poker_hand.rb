# A class that evaluates a given poker hand
require './card'

class PokerHand

  def initialize(hand)
    @cards = hand.split().map { |card| Card.new(card) }
  end

  # High Card: Highest value card.
  def highest_card
  end

  # One Pair: Two cards of the same value.
  def one_pair?
  end

  # Two Pairs: Two different pairs.
  def two_pair?
  end

  # Three of a Kind: Three cards of the same value.
  def three_of_a_kind?
  end

  # Straight: All cards are consecutive values.
  def straight?
  end

  # Flush: All cards of the same suit.
  def flush?
  end

  # Full House: Three of a kind and a pair.
  def full_house?
  end

  # Four of a Kind: Four cards of the same value.
  def four_of_a_kind?
  end

  # Straight Flush: All cards are consecutive values of same suit.
  def straight_flush?
  end

  # Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
  def royal_flush?
  end

end
