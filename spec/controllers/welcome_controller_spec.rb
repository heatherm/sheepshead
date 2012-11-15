require 'spec_helper'

describe WelcomeController do
  describe "show" do
    it "should set the session" do
      get :show
      @request.session[:game_id].should_not be_nil
    end
  end
end