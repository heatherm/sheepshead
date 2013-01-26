require 'spec_helper'

describe Hand do

  describe 'fail' do
    it 'should return an array of all non-trump cards' do
      hand = Hand.make
      cards = [double(trump?: false),double(trump?: false),double(trump?: false),double(trump?: true),double(trump?: true)]
      hand.stub(:cards).and_return(cards)
      hand.fail.count.should == 3
    end
  end

end