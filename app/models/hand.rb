class Hand < ActiveRecord::Base
  attr_accessible :game_player_id, :card_one_id, :card_two_id, :card_three_id, :card_four_id, :card_five_id, :card_six_id, :position

  def cards
    [Card.find(card_one_id), Card.find(card_two_id), Card.find(card_three_id), Card.find(card_four_id), Card.find(card_five_id), Card.find(card_six_id)]
  end
end