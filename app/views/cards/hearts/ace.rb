class Views::Cards::Hearts::Ace < Erector::Widget
  def content
    widget Views::Cards::Card.new(
        style: @style,
        short_name: "A",
        rank: "ace",
        suit: "&hearts;",
        ace: true
    )
  end
end