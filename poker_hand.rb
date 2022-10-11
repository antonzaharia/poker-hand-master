# A class that evaluates a given poker hand
require './card'

class PokerHand

  def initialize(hand)
    @cards = hand.split().map { |card| Card.new(card) }
  end

  # Utils

  # Returns an array of cards values
  def cards_values
    @card_values ||= @cards.dup.map { |card| card.value }
  end

  # Returns an array of cards suits
  def cards_suits
    @card_suits ||= @cards.dup.map { |card| card.suit }
  end

  # Returns an array of value pairs
  def value_pairs
    @value_pairs ||= uniqe_value_pairs
  end

  # Returns and array of hashes and pairs the cards based on their values
  def uniqe_value_pairs
    pairs = []
    cards_values.map do |card_value|
      count = cards_values.count(card_value)

      pairs << { value: card_value, count: count } if count > 1
    end
    pairs.uniq
  end

  ### Hand classification methods

  # High Card: Highest value card.
  # To be used in need of comparing two high card hands
  def highest_card
    @cards.max_by { |card| card.value }
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
