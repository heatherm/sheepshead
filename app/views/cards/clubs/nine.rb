class Views::Cards::Clubs::Nine < Erector::Widget
  def content
    widget Views::Cards::Card.new(
               style: @style,
               id: @id,
               display: @display,
               short_name: "9",
               rank: "nine",
               suit: "&clubs;",
               spots: [:A1, :A2, :A4, :A5, :B3, :C1, :C2, :C4, :C5]
           )
  end
end