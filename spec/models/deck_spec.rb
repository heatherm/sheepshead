require 'spec_helper'

describe Deck do
  before do
    @deck = Deck.new
  end
  it "has 32 cards" do
    @deck.cards.count.should == 32
  end

  it "has 120 points total" do
    @deck.cards.sum(&:value).should == 120
  end

  it "has 14 trump" do
    @deck.cards.select{ |c| c.trump }.count.should == 14
  end
end