require 'machinist/active_record'

Bury.blueprint do
  card_one_id {1}
  card_two_id {2}
end

Card.blueprint do
  suit       { :queen }
  rank       { :clubs }
  value      { 3 }
  trump      { true }
  trump_rank { 14 }
end

Game.blueprint do
end

GamePlayer.blueprint do
  game   { Game.make! }
  player { Player.make! }
end

Hand.blueprint do
  game_player_id {1}
  card_one_id    {1}
  card_two_id    {2}
  card_three_id  {3}
  card_four_id   {4}
  card_five_id   {5}
  card_six_id    {6}
  trick_id       {1}
  position       {1}
end

Play.blueprint do
  trick_id       {1}
  game_player_id {1}
  card_id        {1}
end

Player.blueprint do
  username { "user#{sn}" }
end

Trick.blueprint do
  game_id       {1}
  winner_id     {1}
  play_one_id   {1}
  play_two_id   {2}
  play_three_id {3}
  play_four_id  {4}
  play_five_id  {5}
end