require 'spec_helper'

describe GameController do
  describe "show" do
    context 'when the user already has a session' do
      before do
        @game = Game.make!
        @request.session[:game_id] = @game.id
      end
      it "should rehydrate the game from the session" do
        get :show
        assigns(:game).should == @game
        Game.count.should == 1
      end
    end

    context 'when the user is new' do
      it "should set the session" do
        get :show
        @request.session[:game_id].should_not be_nil
        assigns(:game).should_not be_nil
        Game.count.should == 1
      end
    end
  end
end