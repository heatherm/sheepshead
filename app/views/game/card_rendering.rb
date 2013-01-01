#encoding utf-8
module Views::Game::CardRendering

  def render_card_block(cards, show)
    positions = [
         "left:1em;top:0em;", "left:3em;top:.25em;", "left:5em;top:0em;",
         "left:7em;top:.25em;", "left:9em;top:0em;", "left:11em;top:.25em;",
         "left:13em;top:0em;", "left:15em;top:.25em;"]

    display = show ? "" : "visibility:hidden;"
    div.cardBlock style: "position: relative; height:10em;" do
      cards.each_with_index do |card, i|
        widget eval("Views::Cards::#{card.suit.humanize}::#{card.rank.humanize}.new(style: positions[i], display: display, id: card.id)")
      end
    end
  end

end