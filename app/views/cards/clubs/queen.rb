class Views::Cards::Clubs::Queen < Erector::Widget
  def content
    widget Views::Cards::Card.new(
               style: @style,
               id: @id,
               display: @display,
               short_name: "Q",
               rank: "queen",
               suit: "&clubs;",
               src: "assets/queen.gif",
               spots: [:A1, :C5]
           )
  end
end