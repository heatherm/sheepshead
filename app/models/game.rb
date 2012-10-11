class Game < ActiveRecord::Base
  attr_accessor :deck

  has_many :game_players
  has_many :players, through: :game_players

  def initialize
    super
    @deck = Deck.new
    5.times do |i|
      player = Player.create!
      player.username = "Player #{i}"
      game_player = GamePlayer.create!
      game_player.game = self
      game_player.player = player
      game_player.save!
    end
    @deck.shuffle
  end

end