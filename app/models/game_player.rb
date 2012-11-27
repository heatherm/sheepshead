class GamePlayer < ActiveRecord::Base
  attr_accessible :game, :player
  belongs_to :game
  belongs_to :player
end