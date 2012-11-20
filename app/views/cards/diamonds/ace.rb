class Views::Cards::Diamonds::Ace < Erector::Widget
  def content
    widget Views::Cards::Card.new(
        style: @style,
        short_name: "A",
        rank: "ace",
        suit: "&diams;",
        ace: true
    )
  end
end