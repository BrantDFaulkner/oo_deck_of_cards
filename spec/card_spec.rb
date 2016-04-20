require 'spec_helper'
require 'card'

RSpec.describe "Card" do
  context 'has public attributes' do
    card = Card.new(:spades, 7)
    describe '#suit' do
      it 'returns a Symbol representing the suit of the card' do
        assert_equal :spades, card.suit
      end
    end

    describe '#rank' do
      it 'returns an integer from 1 to 13 ("Ace" is 1, "King" is 13)' do
        assert_equal 7, card.rank
      end
    end
  end

  describe '#face_card?' do
    it 'returns a boolean representing if the card is a face card (>10)' do
        card = Card.new(:spades, 7)
        assert_equal false, card.face_card?
        card = Card.new(:spades, 11)
        assert_equal true, card.face_card?
    end
  end

  describe "#to_s" do
    it 'returns a human readable string reprensentation of card ("Ace of Spades" or "10 of Clubs")' do
        card = Card.new(:spades, 1)
        assert_equal "Ace of Spades", card.to_s
        card = Card.new(:hearts, 13)
        assert_equal "King of Hearts", card.to_s
    end
  end

  context "is comparable to other cards; compare only by rank" do
    describe "#>" do
      it "returns true if card rank is greater than other card" do
        card1 = Card.new(:spades, 1)
        card2 = Card.new(:spades, 2)
        assert_equal true, card2 > card1
      end

      it "returns false if card rank is not greater than other card" do
        card1 = Card.new(:spades, 1)
        card2 = Card.new(:spades, 2)
        assert_equal false, card1 > card2
      end
    end

    describe "#<" do
      it "returns true if card rank is less than other card" do
        card1 = Card.new(:spades, 1)
        card2 = Card.new(:spades, 2)
        assert_equal true, card1 < card2
      end

      it "returns false if card rank is not less than other card" do
        card1 = Card.new(:spades, 1)
        card2 = Card.new(:spades, 2)
        assert_equal false, card2 < card1
      end
    end

    describe "#==" do
      it "returns true if card is of equal rank to other card" do
        card1 = Card.new(:spades, 2)
        card2 = Card.new(:spades, 2)
        assert_equal true, card1 == card2
      end

      it "returns false if card is not of equal rank to other card" do
        card1 = Card.new(:spades, 4)
        card2 = Card.new(:spades, 2)
        assert_equal false, card1 == card2
      end
    end
  end

end#Card