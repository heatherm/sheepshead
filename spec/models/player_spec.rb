# encoding: UTF-8
require 'spec_helper'

describe Player do
  before do
    @player = Player.make!
  end

  it 'has timestamps' do
    @player.created_at.should_not be_nil
    @player.updated_at.should_not be_nil
  end

  it 'has a username' do
    @player.username.should_not be_nil
  end
end