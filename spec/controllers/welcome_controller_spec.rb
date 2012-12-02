require 'spec_helper'

describe WelcomeController do
  render_views

  describe "GET show" do
    it "shows" do
      get :show
      response.should be_success
    end
  end
end