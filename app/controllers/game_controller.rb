class GameController < ApplicationController

  def home
  end

  def new
    find_game
  end

  def find_game
    if game_id = session && session[:game_id]
      @game = Game.find(game_id)
    else
      @game = Game.new
      session[:game_id] = @game.id
    end
  end
end