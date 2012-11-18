class Views::Cards::Diamonds::Jack < Erector::Widget
  def content
    render partial: "/cards/card", locals: {
           style: @style,
           short_name: "J",
           rank: "jack",
           suit: "&diams;",
           src: "assets/jack.gif",
           spots: [:A1, :C5]
    }
  end
end