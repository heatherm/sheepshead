class Views::Cards::Diamonds::Nine < Erector::Widget
  def content
    widget Views::Cards::Card.new(
        style: @style,
        short_name: "9",
        rank: "nine",
        suit: "&diams;",
        spots: [:A1, :A2, :A4, :A5, :B3, :C1, :C2, :C4, :C5]
    )
  end
end