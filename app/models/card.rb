class Card
  attr_reader :suit, :rank, :value, :trump

  def initialize(args)
    @suit = args[:suit]
    @rank = args[:rank]
    @value = args[:value]
    @trump = args[:trump]
  end

  def trump?
    self[:trump] == true
  end

  def fail?
    self[:trump] == false
  end
end