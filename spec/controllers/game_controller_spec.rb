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
        controller.should_not_receive(:create_new_game)
        Game.count.should == 1
      end
    end

    context 'when the user is new' do
      it "should set the session" do
        game = double("game", id: 1)
        controller.should_receive(:create_new_game).and_return(game)
        @request.session[:game_id] = nil
        lambda {
          get :show }.should change {@request.session[:game_id]}.from(nil).to(1)
      end
    end
  end
end