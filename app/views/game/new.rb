class Views::Game::New < Erector::Widget
  def content
    h3 "Game #{@game.id} : #{Time.now}"

    @game.players.each do |player|
      div do
        p "#{player.username} #{'is Dealer' if player == @game.dealer}"
        if player == @game.user
          p player.hand.map {|c| [c.rank, c.suit]}
        else
          p "Boobered"
        end
      end
    end
  end
end