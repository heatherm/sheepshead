class Views::Cards::Diamonds::Ten < Erector::Widget
  def content
    widget Views::Cards::Card.new(
               style: @style,
               id: @id,
               display: @display,
               short_name: "10",
               rank: "ten",
               suit: "&diams;",
               spots: [:A1, :A2, :A4, :A5, :B2, :B4, :C1, :C2, :C4, :C5]
           )
  end
end