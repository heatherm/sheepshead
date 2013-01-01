#encoding utf-8

include Views::Game::CardRendering

class Views::Game::Play < Views::Layouts::Application
  def initialize(attr={})
    super(page_title: "First Round")
    @hand = attr[:hand]
    @picker = attr[:picker]
  end

  def main
    div.row do
      h3 "[Played cards will show up here]"
    end

    div.row do
      div.span5 do
        seat = @hand.position
        h3 seat == 0 ? "You are the dealer." : "You are #{seat} #{pluralize(seat, "seat", "seats")} to the left of the dealer."
        h3 @picker ? "You are the picker" : "Someone else picked"
        h5 "Select a card to play."
        render_card_block(@hand.cards, true)
      end
    end
  end

end