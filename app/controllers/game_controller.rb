class GameController < ApplicationController
  def home
  end

  def new
    @game = Game.new
  end
end