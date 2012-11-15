require 'spec_helper'

describe GamePlayer do
  before do
    @gp = GamePlayer.make!
  end

  it 'has timestamps' do
    @gp.updated_at.should_not be_nil
    @gp.created_at.should_not be_nil
  end

  describe 'relations' do
    it 'belongs to a game' do
      @gp.game.should_not be_nil
    end

    it 'belongs to a player' do
      @gp.player.should_not be_nil
    end
  end

  describe 'picker' do
    it 'defaults picker to false' do
      @gp.picker.should be_false
    end
  end

  describe 'partner' do
    it 'defaults partner to false' do
      @gp.partner.should be_false
    end
  end
end