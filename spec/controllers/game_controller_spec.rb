require 'spec_helper'

describe GameController do
  describe "new" do
    it "should set the session" do
      get :new
      @request.session[:game_id].should_not be_nil
    end
  end
end