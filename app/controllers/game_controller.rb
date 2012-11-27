class GameController < ApplicationController
  def show
    @foo = "foo"
    find_game
    render text: Views::Game::Show.new(foo: @foo).to_s
  end

  def find_game
    if game_id = session && session[:game_id]
      @game = Game.find(game_id)
    else
      @game = new_game
      session[:game_id] = @game.id
    end
  end

  def new_game
    game = Game.create
    time = Time.now.to_i

    @player1 = Player.create(username: "Player1#{time}")
    #@player2 = Player.create(username: "Player2#{time}")
    #@player3 = Player.create(username: "Player3#{time}")
    #@player4 = Player.create(username: "Player4#{time}")
    #@player5 = Player.create(username: "Player5#{time}")
    #
    @game_player1 = GamePlayer.create(game: game, player: @player1)
    #@game_player2 = GamePlayer.create(game: game, player: @player2)
    #@game_player3 = GamePlayer.create(game: game, player: @player3)
    #@game_player4 = GamePlayer.create(game: game, player: @player4)
    #@game_player5 = GamePlayer.create(game: game, player: @player5)

    shuffled_deck = Card.all.shuffle

    @hand1 = Hand.create(game_player_id: @game_player1.id, card_one_id: shuffled_deck.shift.id, card_two_id: shuffled_deck.shift.id,
                        card_three_id:shuffled_deck.shift.id, card_four_id:shuffled_deck.shift.id, card_five_id:shuffled_deck.shift.id,
                        card_six_id: shuffled_deck.shift.id, position: 1)
    #@hand2 = Hand.create(game_player: @game_player2, card_one: shuffled_deck.shift, card_two: shuffled_deck.shift,
    #                    card_three:shuffled_deck.shift, card_four:shuffled_deck.shift, card_five:shuffled_deck.shift,
    #                    card_six: shuffled_deck.shift,position: 2)
    #@hand3 = Hand.create(game_player: @game_player3, card_one: shuffled_deck.shift, card_two: shuffled_deck.shift,
    #                    card_three:shuffled_deck.shift, card_four:shuffled_deck.shift, card_five:shuffled_deck.shift,
    #                    card_six: shuffled_deck.shift,position: 3)
    #@hand4 = Hand.create(game_player: @game_player4, card_one: shuffled_deck.shift, card_two: shuffled_deck.shift,
    #                    card_three:shuffled_deck.shift, card_four:shuffled_deck.shift, card_five:shuffled_deck.shift,
    #                    card_six: shuffled_deck.shift, position: 4)
    #@hand5 = Hand.create(game_player: @game_player5, card_one: shuffled_deck.shift, card_two: shuffled_deck.shift,
    #                    card_three:shuffled_deck.shift, card_four:shuffled_deck.shift, card_five:shuffled_deck.shift,
    #                    card_six: shuffled_deck.shift, position: 5)
    #
    #@bury = Bury.create(card_one: shuffled_deck.shift, card_two: shuffled_deck.shift)

    #@trick1 = Trick.create(game: game)
    #@play1 = Play.create(trick: @trick1, player: @player1)
  end
end