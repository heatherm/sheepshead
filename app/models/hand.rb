class Hand < ActiveRecord::Base
  attr_accessible :game_player_id, :card_one_id, :card_two_id, :card_three_id, :card_four_id, :card_five_id, :card_six_id, :position

  def cards
    [Card.find(card_one_id), Card.find(card_two_id), Card.find(card_three_id), Card.find(card_four_id), Card.find(card_five_id), Card.find(card_six_id)]
  end

  def update_to(new_hand_card_ids)
    self.update_attribute(:card_one_id, new_hand_card_ids[0])
    self.update_attribute(:card_two_id, new_hand_card_ids[1])
    self.update_attribute(:card_three_id, new_hand_card_ids[2])
    self.update_attribute(:card_four_id, new_hand_card_ids[3])
    self.update_attribute(:card_five_id, new_hand_card_ids[4])
    self.update_attribute(:card_six_id, new_hand_card_ids[5])
    self.save
  end
end