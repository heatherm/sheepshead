#encoding utf-8
class Views::Game::Show < Views::Layouts::Application
  def initialize(attr={})
    super(page_title: "Play")
  end

  def main
    h1 @foo
    div.row do
      div.span12 do
        #[@hand1].each do |hand|
        #  div.cardBlock style: "position: relative; height:10em;" do
        #    positions = [
        #         "left:1em;top:0em;", "left:3em;top:.25em;", "left:5em;top:0em;",
        #         "left:7em;top:.25em;", "left:9em;top:0em;", "left:11em;top:.25em;",
        #         "left:13em;top:0em;", "left:15em;top:.25em;"]
        #    hand.cards.each do |card, i|
        #      widget eval("Views::Cards::#{card.suit.humanize}::#{card.rank.humanize}.new(style: positions[i])")
        #    end
        #  end
        #end
      end

    end
  end
end