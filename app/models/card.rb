class Card < ActiveRecord::Base
  attr_accessible :suit, :rank, :value, :trump, :trump_rank

  def trump?
    self.trump == true
  end

  def fail?
    self.trump == false
  end
end