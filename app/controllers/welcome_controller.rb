class WelcomeController < ApplicationController
  def show
    render :file => 'welcome/show.rb'
  end
end
