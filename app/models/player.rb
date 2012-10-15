class Player < ActiveRecord::Base
  attr_accessor :hand

  has_many :game_players
  has_many :games, through: :game_players

  def initialize(attributes = nil)
    super(attributes)
    @hand = []
  end

  def pick?
    @hand.count{|c| c.trump? } > 3
  end

  def bury
    bury = []
    fail = @hand.select{ |card| card.fail? }
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
    end
    bury
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