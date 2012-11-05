class Game < ActiveRecord::Base
  has_many :game_players
  has_many :players, through: :game_players

  after_create :create_players

  def create_players
    5.times do |i|
      p = Player.create!(username: "Player #{i + 1}")
      GamePlayer.create!(player: p, game: self)
    end
  end

  #def find_a_picker
  #  game_players.each do |p|
  #    break if game_has_picker?
  #    present_opportunity_to_pick(p)
  #  end
  #  unless @picker
  #    deal
  #    find_a_picker
  #  end
  #end
  #
  #def present_opportunity_to_pick(player)
  #  if player.should_pick?
  #    player.picker = true
  #    player.pick_cards_to_bury
  #  end
  #end
  #
  #def assign_player_roles
  #  game_players.first.position = 1
  #  @user = game_players.sample
  #end
  #
  #def set_round_and_turn_number
  #  @turn_number = 0
  #end
  #
  #def make_players
  #  @players = []
  #  5.times do |i|
  #    @players << make_player(i)
  #  end
  #  @players
  #end
  #
  #def make_player(i)
  #  player = Player.new
  #  player.username = "Player #{i + 1}"
  #  player.save!
  #  game_player = GamePlayer.new
  #  game_player.game = self
  #  game_player.player = player
  #  game_player.save!
  #  player
  #end
  #
  #def next_turn
  #  @turn_number += 1
  #  @turn = players[turn_number % players.count]
  #  @turn.go!(self)
  #end
  #
  #def advance_round
  #  @round += 1
  #  change_dealer = false
  #  players.each do |player|
  #    if change_dealer == true
  #      @dealer = player
  #      break
  #    end
  #    if player == @dealer
  #      change_dealer = true
  #    end
  #  end
  #  self
  #end
  #
  #def deal
  #  @deck = Deck.new
  #  cards.shuffle!
  #  empty_player_hands_and_blind
  #  deal_three_to_each_player
  #  deal_blind
  #  deal_three_to_each_player
  #  deal if redeal_needed?
  #end
  #
  #def empty_player_hands_and_blind
  #  blind = []
  #  players.each {|p| p.hand = []}
  #end
  #
  #def deal_three_to_each_player
  #  players.each do |p|
  #    p.hand << deck.cards.pop(3)
  #    p.hand.flatten!
  #  end
  #end
  #
  #def deal_blind
  #  @blind = []
  #  blind << deck.cards.pop(2)
  #  blind.flatten!
  #end
  #
  #def redeal_needed?
  #  players.each do |p|
  #    if !(p.has_face? || p.has_trump? || p.has_ace?)
  #      return true
  #    end
  #  end
  #  false
  #end

end