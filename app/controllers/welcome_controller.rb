class WelcomeController < ActionController::Base
  def show
    find_game
  end

  def find_game
    if game_id = session && session[:game_id]
      @game = Game.find(game_id)
    else
      @game = Game.create
      session[:game_id] = @game.id
    end
  end
end
