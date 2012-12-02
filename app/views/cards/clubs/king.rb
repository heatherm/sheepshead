class Views::Cards::Clubs::King < Erector::Widget
  def content
    widget Views::Cards::Card.new(
               style: @style,
               id: @id,
               display: @display,
               short_name: "K",
               rank: "king",
               suit: "&clubs;",
               src: "assets/king.gif",
               spots: [:A1, :C5]
           )
  end
end