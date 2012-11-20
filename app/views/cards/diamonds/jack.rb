class Views::Cards::Diamonds::Jack < Erector::Widget
  def content
    widget Views::Cards::Card.new(
           style: @style,
           short_name: "J",
           rank: "jack",
           suit: "&diams;",
           src: "assets/jack.gif",
           spots: [:A1, :C5]
    )
  end
end