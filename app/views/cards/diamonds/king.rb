class Views::Cards::Diamonds::King < Erector::Widget
  def content
    widget Views::Cards::Card.new(
               style: @style,
               id: @id,
               display: @display,
               short_name: "K",
               rank: "king",
               suit: "&diams;",
               src: "assets/king.gif",
               spots: [:A1, :C5]
           )
  end
end