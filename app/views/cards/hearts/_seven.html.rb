class Views::Cards::Hearts::Seven < Erector::Widget
  def content
    render partial: '/cards/card', locals: {
        style: @style,
        short_name: "7",
        rank: "seven",
        suit: "&hearts;",
        spots: [:A1, :A3, :A5, :B2, :C1, :C3, :C5]
    }
  end
end