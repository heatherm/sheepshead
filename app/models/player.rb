class Player < ActiveRecord::Base
  attr_accessor :hand

  has_many :game_players
  has_many :games, through: :game_players

  def initialize(attributes = nil)
    super(attributes)
    @hand = []
  end

  def pick?
    trump = @hand.select{|c| c.trump?}
    max_points_to_bury = @hand.sort{|x, y| x.value <=> y.value }.last(2).map(&:value).sum
    num_trump = trump.count
    trump_value = 0
    trump.each do |card|
      trump_value += card.trump_rank
    end
    (num_trump > 3 && trump_value > 33) || (trump_value > 29 && max_points_to_bury > 19)
  end

  def bury
    bury = []
    fail = @hand.select{ |card| card.fail? }
    trump = @hand.select { |card| card.trump? }
    if fail.count > 2
      hearts = fail.select{|c| c.suit == :hearts }
      spades = fail.select{|c| c.suit == :spades }
      clubs = fail.select{|c| c.suit == :clubs }
      if hearts.count == 1 && bury.count < 2
        bury << hearts.first
      end
      if spades.count == 1 && bury.count < 2
        bury << spades.first
      end
      if clubs.count == 1 && bury.count < 2
        bury << clubs.first
      end
    elsif fail.count == 1
      high_value_trump = trump.select {|card| card.value > 9}
      if high_value_trump.count > 1
        bury << high_value_trump.sort{|x, y| y.value <=> x.value }.last(2)
      else
        bury << trump.sort{|x, y| y.trump_rank <=> x.trump_rank}.last(2)
      end
    end
    bury.flatten
  end

  def has_face?
    @hand.each do |c|
      rank = c.rank
      if (rank == :queen || rank == :king || rank == :jack)
        return true
      end
    end
    false
  end

  def has_trump?
    @hand.each do |c|
      if c.trump?
        return true
      end
    end
    false
  end

  def has_ace?
    @hand.each do |c|
      if c.rank == :ace
        return true
      end
    end
    false
  end

end