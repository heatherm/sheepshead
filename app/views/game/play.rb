#encoding utf-8

include Views::Game::CardRendering

class Views::Game::Play < Views::Layouts::Application
  def initialize(attr={})
    super(page_title: "First Round")
    @hand = attr[:hand]
  end

  def main
    div.row do
      div.span5 do
        h3 "Select a card to play. You are the dealer and picker."
        render_card_block(@hand.cards, true)
      end
    end
  end

end