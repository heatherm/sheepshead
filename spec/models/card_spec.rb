require 'spec_helper'

describe Card do
  before do
    @card = Card.new({suit: :clubs, rank: :queen, value: 3, trump: true})
  end

  it "has a suit" do
    @card.suit.should == :clubs
  end

  it "has a rank" do
    @card.rank.should == :queen
  end

  it "has a point value" do
    @card.value.should == 3
  end

  it "knows if it is trump" do
    @card.trump?.should == true
  end

  it "knows if it is fail" do
    @card.fail?.should == false
  end
end