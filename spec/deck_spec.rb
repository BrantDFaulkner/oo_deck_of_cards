require 'spec_helper'
require 'deck'

RSpec.describe "Deck" do
  describe '#initialize' do
    it 'fills deck with 52 cards; 13 cards from each of the 4 suits' do
      deck = Deck.new
      assert_equal Card, deck.cards[0].class
      assert_equal 52, deck.cards.length
    end
  end

  context 'has public attributes' do
    describe '#cards' do
      it 'reutrns an array of remaining cards in the deck' do
        deck = Deck.new
        assert_equal Array, deck.cards.class
      end
    end
  end

  describe '#count' do
    it 'reutrns an integer representing the number of remaining cards' do
      deck = Deck.new
      assert_equal 52, deck.count
    end
  end

  describe '#draw(n)' do
    it 'removes the last "n" cards from the deck and returns them in an array' do
      deck = Deck.new
      hand = deck.draw(5)
      assert_equal Array, hand.class
      assert_equal 5, hand.size
    end
  end

  describe '#shuffle' do
    it 'randomizes the order of the cards in the deck' do
      #false failure 1/52, rewrite to negligible
      first_card = Deck.new.cards[0].to_s
      deck2 = Deck.new
      deck2.shuffle
      assert_equal 52, deck2.count
      second_card = deck2.cards[0].to_s
      assert_equal false, first_card == second_card
    end
  end

end#Deck