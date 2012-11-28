#encoding utf-8
class Views::Game::Show < Views::Layouts::Application
  def initialize(attr={})
    super(page_title: "Play")
    @hands = attr[:hands]
    @bury = attr[:bury]
  end

  def main
    div.row do
      div.span4 do
        h3 "Hands"
        @hands.each_with_index do |hand, i|
          render_card_block(hand.cards, i != 0)
        end
      end
      div.span3 do
        h3 "Blind"
        render_card_block(@bury.cards, true)
      end
    end
  end

  def render_card_block(cards, hidden)
    positions = [
         "left:1em;top:0em;", "left:3em;top:.25em;", "left:5em;top:0em;",
         "left:7em;top:.25em;", "left:9em;top:0em;", "left:11em;top:.25em;",
         "left:13em;top:0em;", "left:15em;top:.25em;"]

    display = hidden ? "visibility:hidden;" : ""
    blockClass = hidden ? "cardBlock" : "cardBlock turn"
    div class: blockClass, style: "position: relative; height:10em;" do
      cards.each_with_index do |card, i|
        widget eval("Views::Cards::#{card.suit.humanize}::#{card.rank.humanize}.new(style: positions[i], display: display)")
      end
    end
  end
end