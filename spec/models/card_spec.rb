require 'spec_helper'

describe Card do
  before do
    @queen_of_clubs = Card.find_by_suit_and_rank(:clubs, :queen)
  end

  it "has a suit" do
    @queen_of_clubs.suit.should == "clubs"
  end

  it "has a rank" do
    @queen_of_clubs.rank.should == "queen"
  end

  it "has a point value" do
    @queen_of_clubs.value.should == 3
  end

  it "knows if it is trump" do
    @queen_of_clubs.trump.should == true
  end

  it "has a trump rank" do
    @queen_of_clubs.trump_rank.should == 14
  end

  it 'should have 32 cards in the db' do
    Card.count.should == 32
  end
end