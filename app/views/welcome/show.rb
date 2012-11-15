class Views::Welcome::Show < Erector::Widget
  def content
    h1 "Welcome to Sheepshead Online"
    widget Form, :action => "/game/#{@game.id}", :method => "get" do
      input :type => "submit", :value => "Go to Game!"
    end
  end
end