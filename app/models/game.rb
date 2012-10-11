class Game < ActiveRecord::Base
  attr_accessor :deck

  has_many :game_players
  has_many :players, through: :game_players

  def initialize
    super
    @deck = Deck.new
  end
end