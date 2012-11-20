class Views::Cards::Clubs::Ace < Erector::Widget
  def content
    widget Views::Cards::Card.new(
        style: @style,
        short_name: "A",
        rank: "ace",
        suit: "&clubs;",
        ace: true
    )
  end
end