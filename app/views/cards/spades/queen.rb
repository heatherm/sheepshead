class Views::Cards::Spades::Queen < Erector::Widget
  def content
    widget Views::Cards::Card.new(
           style: @style,
           short_name: "Q",
           rank: "queen",
           suit: "&spades;",
           src: "assets/queen.gif",
           spots: [:A1, :C5]
    )
  end
end