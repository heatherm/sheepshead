class Card
  attr_accessor :suit, :rank, :value, :trump

  def initialize(args)
    @suit = args[:suit]
    @rank = args[:rank]
    @value = args[:value]
    @trump = args[:trump]
  end
end