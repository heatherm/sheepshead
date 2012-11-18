class Views::Cards::Clubs::Ace < Erector::Widget
  def content
    render partial: '/cards/card', locals: {
        style: @style,
        short_name: "A",
        rank: "ace",
        suit: "&clubs;",
        ace: true
    }
  end
end