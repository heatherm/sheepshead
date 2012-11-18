class Views::Cards::Spades::Eight < Erector::Widget
  def content
    render partial: '/cards/card', locals: {
        style: @style,
        short_name: "8",
        rank: "eight",
        suit: "&spades;",
        spots: [:A1, :A3, :A5, :B2, :B4, :C1, :C3, :C5]
    }
  end
end