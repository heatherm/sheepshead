class Views::Cards::Spades::Ace < Erector::Widget
  def content
    widget Views::Cards::Card.new(
               style: @style,
               display: @display,
               short_name: "A",
               rank: "ace",
               suit: "&spades;",
               ace: true
           )
  end
end