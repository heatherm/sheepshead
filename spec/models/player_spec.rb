# encoding: UTF-8
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

  describe "when the hand has an ace, face and a trump" do
    before do
      @player = Player.make!
      @player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :eight, value: 0, trump: false})
      ]
    end

    it "should know that it has all three" do
      @player.has_face?.should be_true
      @player.has_ace?.should be_true
      @player.has_trump?.should be_true
    end
  end

  describe "when the hand has an ace, face and a trump" do
    before do
      @player = Player.make!
      @player.hand = [
          Card.new({suit: :clubs, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :clubs, rank: :seven, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :ten, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :seven, value: 0, trump: false})
      ]
    end

    it "should know that it does not have all three" do
      @player.has_face?.should be_false
      @player.has_ace?.should be_false
      @player.has_trump?.should be_false
    end
  end

  describe "pick?" do
    it "should pick if the hand has four or more trump and at least one is a queen: Q♣, Q♥, J♠, J♥, A♠, 9♥" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :spades, rank: :jack, value: 2, trump: true, trump_rank: 9}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false})
      ]
      player.should_pick?.should be_true
    end

    it "should not pick if the hand has fewer than four trump: Q♣, Q♥, J♥, A♠, 9♥, 8♥" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :eight, value: 0, trump: false})
      ]
      player.should_pick?.should be_false
    end

    it "should not pick if trump are little: J♣, J♦, A♦, 8♦, A♠, A♥" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :jack, value: 2, trump: true, trump_rank: 10}),
          Card.new({suit: :diamonds, rank: :jack, value: 2, trump: true, trump_rank: 7}),
          Card.new({suit: :diamonds, rank: :ace, value: 11, trump: true, trump_rank: 6}),
          Card.new({suit: :diamonds, rank: :eight, value: 0, trump: true, trump_rank: 2}),
          Card.new({suit: :spades, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :ace, value: 11, trump: false})
      ]
      player.should_pick?.should be_false
    end

    it "should pick if you have more than 20 or more points to bury: Q♠, Q♥, 7♦, K♦, 10♥, 10♣" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :king, value: 4, trump: true, trump_rank: 4}),
          Card.new({suit: :diamonds, rank: :seven, value: 0, trump: true, trump_rank: 1}),
          Card.new({suit: :hearts, rank: :ten, value: 10, trump: false}),
          Card.new({suit: :clubs, rank: :ten, value: 10, trump: false})
      ]
      player.should_pick?.should be_true
    end

    it "should pick if you have 15 points to bury and 4 trump: Q♣, Q♦, A♦, 10♦, A♥, K♥" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :diamonds, rank: :queen, value: 3, trump: true, trump_rank: 11}),
          Card.new({suit: :diamonds, rank: :ace, value: 11, trump: true, trump_rank: 6}),
          Card.new({suit: :diamonds, rank: :ten, value: 10, trump: true, trump_rank: 5}),
          Card.new({suit: :hearts, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :king, value: 4, trump: false})
      ]
      player.should_pick?.should be_true
    end

    it "should pick with 5 trump: Q♠, Q♥, J♦, 10♦, 7♦, K♥" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :jack, value: 2, trump: true, trump_rank: 7}),
          Card.new({suit: :diamonds, rank: :ten, value: 10, trump: true, trump_rank: 5}),
          Card.new({suit: :diamonds, rank: :seven, value: 0, trump: true, trump_rank: 1}),
          Card.new({suit: :hearts, rank: :king, value: 4, trump: false})
      ]
      player.should_pick?.should be_true
    end
  end

  describe "bury" do
    it "should try to eliminate fail suits" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :hearts, rank: :nine, value: 0, trump: false}),
          Card.new({suit: :hearts, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :spades, rank: :eight, value: 0, trump: false}),
          Card.new({suit: :clubs, rank: :eight, value: 0, trump: false})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["spades - eight", "clubs - eight"]
    end
    
    it "should go trump solid if possible" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :queen, value: 3, trump: true, trump_rank: 11}),
          Card.new({suit: :clubs, rank: :jack, value: 2, trump: true, trump_rank: 10}),
          Card.new({suit: :spades, rank: :jack, value: 2, trump: true, trump_rank: 9}),
          Card.new({suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8}),
          Card.new({suit: :clubs, rank: :eight, value: 0, trump: false})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["hearts - jack", "clubs - eight"]
    end

    it "if you have high trump and a lot of them, you should try to bury points" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :ace, value: 11, trump: true, trump_rank: 6}),
          Card.new({suit: :diamonds, rank: :ten, value: 10, trump: true, trump_rank: 5}),
          Card.new({suit: :diamonds, rank: :eight, value: 0, trump: true, trump_rank: 2}),
          Card.new({suit: :diamonds, rank: :seven, value: 0, trump: true, trump_rank: 1}),
          Card.new({suit: :clubs, rank: :eight, value: 0, trump: false})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["diamonds - ace", "diamonds - ten"]
    end

    it "hand: Q♠, Q♥, J♦, K♦, 10♥, 10♣, blind: 8♦, 7♣" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :jack, value: 2, trump: true, trump_rank: 7}),
          Card.new({suit: :diamonds, rank: :king, value: 4, trump: true, trump_rank: 4}),
          Card.new({suit: :hearts, rank: :ten, value: 10, trump: false}),
          Card.new({suit: :clubs, rank: :ten, value: 10, trump: false}),
          Card.new({suit: :diamonds, rank: :eight, value: 0, trump: true, trump_rank: 2}),
          Card.new({suit: :clubs, rank: :seven, value: 0, trump: false})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["hearts - ten", "clubs - ten"]
    end

    it "hand: Q♣, Q♦, A♦, 10♦, A♥, K♥, blind: J♣, 9♦" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :diamonds, rank: :queen, value: 3, trump: true, trump_rank: 11}),
          Card.new({suit: :diamonds, rank: :ace, value: 11, trump: true, trump_rank: 6}),
          Card.new({suit: :diamonds, rank: :ten, value: 10, trump: true, trump_rank: 5}),
          Card.new({suit: :hearts, rank: :ace, value: 11, trump: false}),
          Card.new({suit: :hearts, rank: :king, value: 4, trump: false}),
          Card.new({suit: :clubs, rank: :jack, value: 2, trump: true, trump_rank: 10}),
          Card.new({suit: :diamonds, rank: :king, value: 4, trump: true, trump_rank: 4})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["hearts - ace", "hearts - king"]
    end

    it "hand: Q♠, Q♥, J♦, 10♦, 7♦, K♥, blind: Q♣, J♠" do
      player = Player.make!
      player.hand = [
          Card.new({suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13}),
          Card.new({suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12}),
          Card.new({suit: :diamonds, rank: :jack, value: 2, trump: true, trump_rank: 7}),
          Card.new({suit: :diamonds, rank: :ten, value: 10, trump: true, trump_rank: 5}),
          Card.new({suit: :diamonds, rank: :seven, value: 0, trump: true, trump_rank: 1}),
          Card.new({suit: :hearts, rank: :king, value: 4, trump: false}),
          Card.new({suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14}),
          Card.new({suit: :spades, rank: :jack, value: 2, trump: true, trump_rank: 9})
      ]
      actual = player.bury.map{|card| "#{card.suit} - #{card.rank}"}
      actual.should =~ ["diamonds - seven", "hearts - king"]
    end
  end

  describe "go!" do
    it "should allow the player to pick & bury" do
      game = Game.make!
      player = game.players.first
      player.should_receive(:should_pick?).and_return(true)
      player.should_receive(:bury)
      player.go!(game)
    end
  end
end