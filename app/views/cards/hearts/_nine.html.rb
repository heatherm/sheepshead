class Views::Cards::Hearts::Nine < Erector::Widget
  def content
    render partial: '/cards/card', locals: {
        style: @style,
        short_name: "9",
        rank: "nine",
        suit: "&hearts;",
        spots: [:A1, :A2, :A4, :A5, :B3, :C1, :C2, :C4, :C5]
    }
  end
end