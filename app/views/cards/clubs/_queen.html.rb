class Views::Cards::Clubs::Queen < Erector::Widget
  def content
    render partial: "/cards/card", locals: {
           style: @style,
           short_name: "Q",
           rank: "queen",
           suit: "&clubs;",
           src: "assets/queen.gif",
           spots: [:A1, :C5]
    }
  end
end