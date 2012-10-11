require 'machinist/active_record'

Game.blueprint do
end

GamePlayer.blueprint do
  game { Game.make! }
  player { Player.make! }
end

Player.blueprint do
  username { "user#{sn}" }
end