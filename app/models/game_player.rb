class GamePlayer < ActiveRecord::Base
  attr_accessible :game_id, :player_id
  belongs_to :game
  belongs_to :player

  def make_picker
    self.update_attribute(:picker, true)
    self.update_attribute(:partner, false)
    self.save
  end
end