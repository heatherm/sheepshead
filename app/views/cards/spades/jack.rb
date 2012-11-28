class Views::Cards::Spades::Jack < Erector::Widget
  def content
    widget Views::Cards::Card.new(
               style: @style,
               display: @display,
               short_name: "J",
               rank: "jack",
               suit: "&spades;",
               src: "assets/jack.gif",
               spots: [:A1, :C5]
           )
  end
end