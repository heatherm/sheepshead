class Views::Cards::Diamonds::Ace < Erector::Widget
  def content
    widget Views::Cards::Card.new(
               style: @style,
               id: @id,
               display: @display,
               short_name: "A",
               rank: "ace",
               suit: "&diams;",
               ace: true
           )
  end
end