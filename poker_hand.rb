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
    value_pairs.size == 1
  end

  # Two Pairs: Two different pairs.
  def two_pair?
    value_pairs.size == 2
  end

  # Three of a Kind: Three cards of the same value.
  def three_of_a_kind?
    value_pairs.size == 1 && value_pairs.first[:count] == 3
  end

  # Straight: All cards are consecutive values.
  def straight?
    ace_as_one = cards_values.map { |value| value == 14 ? 1 : value}
    self.class.all_consecutives?(cards_values) || self.class.all_consecutives?(ace_as_one)
  end

  # Flush: All cards of the same suit.
  def flush?
    cards_suits.uniq.size == 1
  end

  # Full House: Three of a kind and a pair.
  def full_house?
    return false unless value_pairs.size == 2

    value_pairs.any? { |pair| pair[:count] == 2 } && value_pairs.any? { |pair| pair[:count] == 3 }
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

  ### Class methods

  # Takes an array and returns true if all elements are consecutive
  def self.all_consecutives?(array)
    array.sort.each_cons(2).all? { |a, b| b == a + 1 }
  end

end
