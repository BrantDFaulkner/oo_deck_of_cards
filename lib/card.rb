
class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def face_card?
    rank > 10
  end

  def to_s
    "#{rank_to_name} of #{suit.capitalize}"
  end

  include Comparable
  def <=>(other)
    rank <=> other.rank
  end

private

  def rank_to_name
    ["Ace", "2","3","4","5","6","7","8","9","10","Jack","Queen","King"][rank-1]
  end

end