require_relative 'card'
require 'minitest'
require 'minitest/autorun'


describe Card do
  describe 'validations' do

    it 'raises an error when the card is not in the right format' do
      expect { Card.new('S2') }
        .must_raise Card::InvalidCardError
    end

    it "raises an error when the card doesn't exist in the deck" do
      expect { Card.new('15H') }
        .must_raise Card::InvalidCardError
    end

  end
end
