class Views::Game::New < Erector::Widget
  def content
    h3 "Game #{@game.id} : #{Time.now}"

    @game.players.each do |player|
      div do
        p "#{'YOU! are ' if player == @game.user} #{player.username} #{'is Dealer' if player == @game.dealer}"
        p "***TAKE a TURN***" if player == @game.turn
        if player == @game.user
          p player.hand.map {|c| [c.rank, c.suit]}
        else
          p "Boobered"
        end
      end
    end

    p "The BLIND"
    @game.blind.each do |card|
      span "CARD "
    end
  end
end