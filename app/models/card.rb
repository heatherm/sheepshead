class Card < ActiveRecord::Base
  attr_accessible :suit, :rank, :value, :trump, :trump_rank
end