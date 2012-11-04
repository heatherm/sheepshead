class Player < ActiveRecord::Base
  attr_accessor :hand, :won_cards

  has_many :game_players
  has_many :games, through: :game_players

  def initialize(attributes = nil)
    super(attributes)
    @hand = []
    @won_cards = []
  end

  def go!(game)
    play_card
  #  game.next_turn
  end

  def play_card
  end

  def should_pick?
    trump = @hand.select { |c| c.trump? }
    max_points_to_bury = @hand.sort { |x, y| x.value <=> y.value }.last(2).map(&:value).sum
    num_trump = trump.count
    trump_value = 0
    trump.each do |card|
      trump_value += card.trump_rank
    end
    (num_trump > 3 && trump_value > 33) || (trump_value > 29 && max_points_to_bury > 19)
  end

  def pick_cards_to_bury
    bury = []
    fail = @hand.select { |card| card.fail? }
    trump = @hand.select { |card| card.trump? }

    if can_bury_all_fail(fail)
      bury = minimize_fail_suits(fail, bury)
    elsif must_bury_trump(fail)
      bury = bury_high_value_then_low_rank(trump, fail, bury)
    end

    won_cards << bury.shift
    won_cards << bury.shift
    won_cards.flatten
  end

  def can_bury_all_fail(fail)
    fail.count > 1
  end

  def bury_high_value_then_low_rank(trump, fail, bury)
    high_value_trump, other = trump.partition { |card| card.value > 9 }
    if high_value_trump.count > 1 && other.count > 4
      high_value_trump.sort! { |x, y| y.value <=> x.value }
      while high_value_trump.count > 0 && bury.count < 2
        bury << high_value_trump.shift
      end
    end
    if fail.count > 0
      while fail.count > 0 && bury.count < 2
        bury << fail.shift
      end
      lowest_ranked_trump_first = trump.sort { |x, y| x.trump_rank <=> y.trump_rank }
      while lowest_ranked_trump_first.count > 0 && bury.count < 2
        bury << lowest_ranked_trump_first.shift
      end
    end
    bury
  end

  def must_bury_trump(fail)
    fail.count < 2
  end

  def minimize_fail_suits(fail, bury)
    hearts = fail.select { |c| c.suit == :hearts }
    spades = fail.select { |c| c.suit == :spades }
    clubs = fail.select { |c| c.suit == :clubs }

    least_fail_first = [hearts, spades, clubs].sort{|x,y| x.count <=> y.count}
    least_fail_first.compact.each do |suit_group|
      while bury.count < 2 && suit_group.count > 0
        bury << suit_group.shift
      end
    end
    bury
  end

  def has_face?
    @hand.each do |c|
      rank = c.rank
      if (rank == :queen || rank == :king || rank == :jack)
        return true
      end
    end
    false
  end

  def has_trump?
    @hand.each do |c|
      if c.trump?
        return true
      end
    end
    false
  end

  def has_ace?
    @hand.each do |c|
      if c.rank == :ace
        return true
      end
    end
    false
  end

end