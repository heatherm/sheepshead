require 'spec_helper'

describe Game do
  before do
    @game = Game.make!
  end
  it "has timestamps" do
    @game.created_at.class.should == ActiveSupport::TimeWithZone
    @game.updated_at.class.should == ActiveSupport::TimeWithZone
  end
end