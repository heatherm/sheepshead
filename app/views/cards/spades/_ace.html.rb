class Views::Cards::Spades::Ace < Erector::Widget
  def content
    render partial: '/cards/card', locals: {
        style: @style,
        short_name: "A",
        rank: "ace",
        suit: "&spades;",
        ace: true
    }
  end
end