class GameController < ApplicationController
  def show
    game = find_game
    game_player_ids = GamePlayer.find_all_by_game_id(game.id).map(&:id)
    @hands = Hand.find_all_by_game_player_id(game_player_ids)
    @bury = Bury.find_by_game_id(game.id)
  end

  def pick
    game = find_game
    game_player_ids = GamePlayer.find_all_by_game_id(game.id).map(&:id)
    @hands = Hand.find_all_by_game_player_id(game_player_ids)
    @bury = Bury.find_by_game_id(game.id)
    @show_blind = true
    render widget: Views::Game::Show
  end

  def find_game
    if game_id = session && session[:game_id]
      game = Game.find(game_id)
    else
      game = create_new_game
      session[:game_id] = game.id
    end
    game
  end

  def create_new_game
    @game = Game.create
    shuffled_deck = Card.all.shuffle

    players = create_players
    game_players = create_game_players(players)

    create_hands(game_players, shuffled_deck)

    Bury.create(card_one_id: shuffled_deck.shift.id, card_two_id: shuffled_deck.shift.id, game_id: @game.id)

    trick1 = Trick.create(game_id: @game.id)
    Play.create(trick_id: trick1.id, game_player_id: game_players.first.id)
    @game
  end

  def create_hands(game_players, shuffled_deck)
    game_players.each_with_index do |game_player, index|
      Hand.create(game_player_id: game_player.id, card_one_id: shuffled_deck.shift.id, card_two_id: shuffled_deck.shift.id,
                          card_three_id:shuffled_deck.shift.id, card_four_id:shuffled_deck.shift.id, card_five_id:shuffled_deck.shift.id,
                          card_six_id: shuffled_deck.shift.id, position: index)
    end
  end

  def create_game_players(players)
    game_players = []
    players.each do |player|
      game_player = GamePlayer.create(game_id: @game.id, player_id: player.id)
      game_players << game_player
    end
    game_players
  end

  def create_players
    players = []
    time = Time.now.to_i
    [1, 2, 3, 4, 5].each do |i|
      player = Player.create(username: "Player#{i}#{time}")
      players << player
    end
    players
  end
end