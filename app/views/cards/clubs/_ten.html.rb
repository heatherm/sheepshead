class Views::Cards::Clubs::Ten < Erector::Widget
  def content
    render partial: '/cards/card', locals: {
        style: @style,
        short_name: "10",
        rank: "queen",
        suit: "&clubs;",
        spots: [:A1, :A2, :A4, :A5, :B2, :B4, :C1, :C2, :C4, :C5]
    }
  end
end