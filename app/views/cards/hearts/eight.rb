class Views::Cards::Hearts::Eight < Erector::Widget
  def content
    widget Views::Cards::Card.new(
        style: @style,
        short_name: "8",
        rank: "eight",
        suit: "&hearts;",
        spots: [:A1, :A3, :A5, :B2, :B4, :C1, :C3, :C5]
    )
  end
end