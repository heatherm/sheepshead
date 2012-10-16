class Card
  attr_reader :suit, :rank, :value, :trump, :trump_rank

  def initialize(args)
    @suit = args[:suit]
    @rank = args[:rank]
    @value = args[:value]
    @trump = args[:trump]
    @trump_rank = args[:trump_rank]
  end

  def trump?
    self.trump == true
  end

  def fail?
    self.trump == false
  end
end