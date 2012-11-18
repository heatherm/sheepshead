class Views::Cards::Diamonds::Queen < Erector::Widget
  def content
    render partial: "/cards/card", locals: {
           style: @style,
           short_name: "Q",
           rank: "queen",
           suit: "&diams;",
           src: "assets/queen.gif",
           spots: [:A1, :C5]
    }
  end
end