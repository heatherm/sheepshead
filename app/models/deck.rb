class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Deck.data.each do |card|
      @cards << card
    end
  end

  def shuffle
    cards.shuffle
  end

  class << self
    def data
      [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :queen, value: 3, trump: true, trump_rank: 11}),
          Card.new({suit: :clubs, rank: :jack, value: 2, trump: true, trump_rank: 10}),
          Card.new({suit: :spades, rank: :jack, value: 2, trump: true, trump_rank: 9}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :diamonds, rank: :jack, value: 2, trump: true, trump_rank: 7}),
          Card.new({suit: :diamonds, rank: :ace, value: 11, trump: true, trump_rank: 6}),
          Card.new({suit: :diamonds, rank: :ten, value: 10, trump: true, trump_rank: 5}),
          Card.new({suit: :diamonds, rank: :king, value: 4, trump: true, trump_rank: 4}),
          Card.new({suit: :diamonds, rank: :nine, value: 0, trump: true, trump_rank: 3}),
          Card.new({suit: :diamonds, rank: :eight, value: 0, trump: true, trump_rank: 2}),
          Card.new({suit: :diamonds, rank: :seven, value: 0, trump: true, trump_rank: 1}),

          Card.new({suit: :clubs, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :clubs, rank: :ten, value: 10, trump: false}),
          Card.new({suit: :clubs, rank: :king, value: 4, trump: false}),
          Card.new({suit: :clubs, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :clubs, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :clubs, rank: :seven, value: 0, trump: false}),

          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :spades, rank: :ten, value: 10, trump: false}),
          Card.new({suit: :spades, rank: :king, value: 4, trump: false}),
          Card.new({suit: :spades, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :spades, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :spades, rank: :seven, value: 0, trump: false}),

          Card.new({suit: :hearts, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :ten, value: 10, trump: false}),
          Card.new({suit: :hearts, rank: :king, value: 4, trump: false}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :seven, value: 0, trump: false})
      ]
    end
  end
end