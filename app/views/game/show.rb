#encoding utf-8
class Views::Game::Show < Views::Layouts::Application
  def initialize(attr={})
    super(page_title: "Play")
    @hands = attr[:hands]
    @bury = attr[:bury]
    @show_blind = attr[:show_blind]
  end

  def main
    div.row do
      div.span5 do
        h3 "Your Hand"
        render_card_block(@hands.first.cards, true)
      end
    end
    div.row do
      div.span3 do
        h3 "Blind"
        render_card_block(@bury.cards, @show_blind ||= false)
      end
      if @show_blind
        show_bury_area
      else
        show_pick_pass_buttons
      end
    end
  end

  def show_bury_area
    h5 "Select two cards and click 'Bury'"
    div class: 'btn btn-large btn-success' do
      link_to "Bury", bury_path
    end
  end

  def show_pick_pass_buttons
    div.span4 do
      br
      div class: 'btn btn-large btn-success' do
        link_to "Pick", pick_path
      end
      br
      br
      div class: 'btn btn-large btn-danger' do
        link_to "Pass", pass_path
      end
    end
  end

  def render_card_block(cards, show)
    positions = [
         "left:1em;top:0em;", "left:3em;top:.25em;", "left:5em;top:0em;",
         "left:7em;top:.25em;", "left:9em;top:0em;", "left:11em;top:.25em;",
         "left:13em;top:0em;", "left:15em;top:.25em;"]

    display = show ? "" : "visibility:hidden;"
    div.cardBlock style: "position: relative; height:10em;" do
      cards.each_with_index do |card, i|
        widget eval("Views::Cards::#{card.suit.humanize}::#{card.rank.humanize}.new(style: positions[i], display: display)")
      end
    end
  end
end