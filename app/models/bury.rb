class Bury < ActiveRecord::Base
  attr_accessible :card_one_id, :card_two_id, :game_id

  def cards
    [Card.find(card_one_id), Card.find(card_two_id)]
  end

  def update_to(selected_card_ids)
    self.update_attribute(:card_one_id, selected_card_ids[0])
    self.update_attribute(:card_two_id, selected_card_ids[1])
    self.save
  end
end