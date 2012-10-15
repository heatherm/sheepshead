require 'spec_helper'

describe Player do
  describe "relations" do
    it "games" do
      game = Game.make!
      game.players.first.games.first.should == game
    end
  end

  describe "hand" do
    it "should be an empty array on initialize" do
      Player.make!.hand.should == []
    end
  end

  describe "pick?" do
    it "should pick if the hand is strong" do
      #Generally, it is best not to pick up the blind unless the player has four or more trump in a five-handed game,
      #and it is best if at least one of those trump is a queen. Picking on three trump is unwise, unless they are very
      #highly powered cards.
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true}),
          Card.new({suit: :spades, rank: :jack, value: 2, trump: true}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true}),
          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false})
      ]
      player.pick?.should be_true
    end

    it "should not pick if the hand is weak" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true}),
          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :eight, value: 0, trump: false})
      ]
      player.pick?.should be_false
    end
  end

  describe "bury" do
    it "should try to eliminate fail suits" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true}),
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :spades, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :clubs, rank: :eight, value: 0, trump: false})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["spades - eight", "clubs - eight"]
    end
  end
end