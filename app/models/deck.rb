class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Deck.data.each do |card_data|
      @cards << Card.new(card_data)
    end
  end

  class << self
    def data
      [
              { suit: :clubs , rank: :queen , value: 3 , trump: true },
              { suit: :spades , rank: :queen , value: 3 , trump: true },
              { suit: :hearts , rank: :queen , value: 3 , trump: true },
              { suit: :diamonds , rank: :queen , value: 3 , trump: true },
              { suit: :clubs , rank: :jack , value: 2 , trump: true },
              { suit: :spades , rank: :jack , value: 2 , trump: true },
              { suit: :hearts , rank: :jack , value: 2 , trump: true },
              { suit: :diamonds , rank: :jack , value: 2 , trump: true },
              { suit: :diamonds , rank: :ace , value: 11 , trump: true },
              { suit: :diamonds , rank: :ten , value: 10 , trump: true },
              { suit: :diamonds , rank: :king , value: 4 , trump: true },
              { suit: :diamonds , rank: :nine , value: 0 , trump: true },
              { suit: :diamonds , rank: :eight , value: 0 , trump: true },
              { suit: :diamonds , rank: :seven , value: 0 , trump: true },

              { suit: :clubs , rank: :ace , value: 11 , trump: false },
              { suit: :clubs , rank: :ten , value: 10 , trump: false },
              { suit: :clubs , rank: :king , value: 4 , trump: false },
              { suit: :clubs , rank: :nine , value: 0 , trump: false },
              { suit: :clubs , rank: :eight , value: 0 , trump: false },
              { suit: :clubs , rank: :seven , value: 0 , trump: false },

              { suit: :spades , rank: :ace , value: 11 , trump: false },
              { suit: :spades , rank: :ten , value: 10 , trump: false },
              { suit: :spades , rank: :king , value: 4 , trump: false },
              { suit: :spades , rank: :nine , value: 0 , trump: false },
              { suit: :spades , rank: :eight , value: 0 , trump: false },
              { suit: :spades , rank: :seven , value: 0 , trump: false },

              { suit: :hearts , rank: :ace , value: 11 , trump: false },
              { suit: :hearts , rank: :ten , value: 10 , trump: false },
              { suit: :hearts , rank: :king , value: 4 , trump: false },
              { suit: :hearts , rank: :nine , value: 0 , trump: false },
              { suit: :hearts , rank: :eight , value: 0 , trump: false },
              { suit: :hearts , rank: :seven , value: 0 , trump: false }
          ]
    end
  end
end