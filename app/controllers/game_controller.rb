class GameController < ApplicationController

  def show
    setup
    render :file => 'game/show.rb'
  end

  def pick
    setup
    @show_blind = true
    render :file => 'game/show.rb'
  end

  def bury
    card_one_id, card_two_id = params[:cards].split(',')
    setup
    bury_plus_hand_ids = [@hand.cards.map(&:id), @bury.cards.map(&:id)].flatten

    selected_card_ids = [card_one_id.to_i, card_two_id.to_i]
    new_hand_card_ids = bury_plus_hand_ids - selected_card_ids

    @bury.update_attribute(:card_one_id, card_one_id)
    @bury.update_attribute(:card_two_id, card_two_id)
    @bury.save

    @hand.update_attribute(:card_one_id, new_hand_card_ids[0])
    @hand.update_attribute(:card_two_id, new_hand_card_ids[1])
    @hand.update_attribute(:card_three_id, new_hand_card_ids[2])
    @hand.update_attribute(:card_four_id, new_hand_card_ids[3])
    @hand.update_attribute(:card_five_id, new_hand_card_ids[4])
    @hand.update_attribute(:card_six_id, new_hand_card_ids[5])
    @hand.save

    @show_blind = true
    redirect_to pick_path
  end

  def setup
    game, game_player = find_game
    @hand = Hand.find_by_game_player_id(game_player.id)
    @bury = Bury.find_by_game_id(game.id)
  end

  def find_game
    if game_id = session && session[:game_id]
      if game_player_id = session[:game_player_id]
        game = Game.find(game_id)
        game_player = GamePlayer.find(game_player_id)
      end
    else
      game, game_player = create_new_game
      session[:game_id] = game.id
      session[:game_player_id] = game_player.id
    end
    [game, game_player]
  end

  def create_new_game
    game = Game.create
    shuffled_deck = Card.all.shuffle

    players = create_players
    game_players = create_game_players(game, players)

    create_hands(game_players, shuffled_deck)

    Bury.create(card_one_id: shuffled_deck.shift.id, card_two_id: shuffled_deck.shift.id, game_id: game.id)

    trick1 = Trick.create(game_id: game.id)
    Play.create(trick_id: trick1.id, game_player_id: game_players.first.id)
    [game, game_players.first]
  end

  def create_hands(game_players, shuffled_deck)
    game_players.each_with_index do |game_player, index|
      Hand.create(game_player_id: game_player.id, card_one_id: shuffled_deck.shift.id, card_two_id: shuffled_deck.shift.id,
                          card_three_id:shuffled_deck.shift.id, card_four_id:shuffled_deck.shift.id, card_five_id:shuffled_deck.shift.id,
                          card_six_id: shuffled_deck.shift.id, position: index)
    end
  end

  def create_game_players(game, players)
    game_players = []
    players.each do |player|
      game_player = GamePlayer.create(game_id: game.id, player_id: player.id)
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