class Views::Cards::Hearts::Ace < Erector::Widget
  def content
    render partial: '/cards/card', locals: {
        style: @style,
        short_name: "A",
        rank: "ace",
        suit: "&hearts;",
        ace: true
    }
  end
end