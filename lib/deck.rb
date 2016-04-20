class Deck
  attr_accessor :cards

  def initialize
    @cards = create_cards
  end

  def count
    cards.length
  end

  def draw(n)
    cards.pop(n)
  end

  def shuffle
    cards.shuffle!
  end

#shuffle manually
  # def shuffle
  #   shuffled = []
  #   until cards.empty?
  #     random_card = cards.delete_at(rand(cards.count))
  #     shuffled << random_card
  #   end
  #   self.cards = shuffled
  # end

private

  def create_cards
    suits.flat_map do |suit|
      ranks.map { |rank| Card.new(suit, rank) }
    end
  end

#implement with each
  # def create_cards
  #   array = []
  #   suits.each do |suit|
  #     ranks.each do |rank|
  #       array << Card.new(suit, rank)
  #     end
  #   end
  #   array
  # end

  def suits
    [:hearts, :diamonds, :spades, :clubs]
  end

  def ranks
    Array(1..13)
  end

end
