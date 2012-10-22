class Game < ActiveRecord::Base
  attr_accessor :deck, :blind, :players, :round, :dealer, :user

  has_many :game_players
  has_many :players, through: :game_players

  delegate :cards, to: :deck

  def initialize(attributes = nil)
    super(attributes)
    @deck = Deck.new
    @blind = []
    @players = []
    5.times do |i|
      player = Player.new
      player.username = "Player #{i +1 }"
      player.save!
      @players << player
      game_player = GamePlayer.new
      game_player.game = self
      game_player.player = player
      game_player.save!
    end
    @round = 1
    @dealer = @players.first
    @user = @players.sample
    cards.shuffle!
    self.deal
  end

  def deal
    deal_three_to_each_player
    deal_blind
    deal_three_to_each_player
    deal if redeal?
  end

  def advance_round
    @round += 1
    change_dealer = false
    @players.each do |player|
      if change_dealer == true
        @dealer = player
        break
      end
      if player == @dealer
        change_dealer = true
      end
    end
    self
  end

  def redeal?
    players.each do |p|
      if !(p.has_face? || p.has_trump? || p.has_ace?)
        return true
      end
    end
    false
  end

  def deal_three_to_each_player
    players.each do |p|
      p.hand << deck.cards.pop(3)
      p.hand.flatten!
    end
  end

  def deal_blind
    blind << deck.cards.pop(2)
    blind.flatten!
  end

end