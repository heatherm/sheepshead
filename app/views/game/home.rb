class Views::Game::Home < Erector::Widget
  def content
    h1 "Welcome to Sheepshead Online"
    h3 "This is a 5-handed version with you playing against 4 computer players. There are no leasters...yet"

    link_to "Start new Game", new_game_path
  end
end