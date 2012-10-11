require 'spec_helper'

describe Deck do
  it "has 32 cards" do
    Deck.new.cards.count.should == 32
  end

  it "has 120 points total" do
    Deck.new.cards.sum(&:value).should == 120
  end
end