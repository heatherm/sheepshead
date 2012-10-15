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

  def has_face?
    @hand.each do |c|
      rank = c[:rank]
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
      if c[:rank] == :ace
        return true
      end
    end
    false
  end

end