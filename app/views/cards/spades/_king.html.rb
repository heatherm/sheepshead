class Views::Cards::Spades::King < Erector::Widget
  def content
    render partial: "/cards/card", locals: {
        style: @style,
        short_name: "K",
        rank: "king",
        suit: "&spades;",
        src: "assets/king.gif",
        spots: [:A1, :C5]
    }
  end
end