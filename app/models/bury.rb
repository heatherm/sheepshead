class Bury < ActiveRecord::Base
  attr_accessible :card_one_id, :card_two_id, :game_id

  def cards
    [Card.find(card_one_id), Card.find(card_two_id)]
  end
end