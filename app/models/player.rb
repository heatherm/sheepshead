class Player < ActiveRecord::Base
  attr_accessor :hand

  has_many :game_players
  has_many :games, through: :game_players

  def initialize(attributes = nil)
    super(attributes)
    @hand = []
  end

end