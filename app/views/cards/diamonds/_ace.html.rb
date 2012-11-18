class Views::Cards::Diamonds::Ace < Erector::Widget
  def content
    render partial: '/cards/card', locals: {
        style: @style,
        short_name: "A",
        rank: "ace",
        suit: "&diams;",
        ace: true
    }
  end
end