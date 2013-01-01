#encoding utf-8

include Views::Game::CardRendering

class Views::Game::Show < Views::Layouts::Application
  def initialize(attr={})
    super(page_title: "Play")
    @hand = attr[:hand]
    @bury = attr[:bury]
    @show_blind = attr[:show_blind]
    @show_bury = attr[:show_bury]
  end

  def main
    div.row do
      div.span5 do
        h3 "Your Hand"
        render_card_block(@hand.cards, true)
      end
    end
    div.row do
      div.span3 do
        h3 "Blind" if @show_blind
        h3 "Bury" if @show_bury
        render_card_block(@bury.cards, ((@show_bury || @show_blind) || false))
      end
      if @show_blind
        show_blind_area
      elsif @show_bury
        show_confirm_bury_area
      else
        show_pick_pass_buttons
      end
    end
  end

  def show_confirm_bury_area
    div.bury do
      h5 "Confirm bury"
      div.area
      br
      div class: 'btn btn-large btn-success' do
        link_to "Confirm & Play", play_path
      end
      br
      br
      div class: 'btn btn-large btn-danger' do
        link_to "Re-pick", pick_path
      end
    end
  end

  def show_blind_area
    div.blind do
      h5 "Select two cards and click 'Bury'"
      div.area
      br
      form_for @bury, action: bury_path, method: :post do
        input.cards type: "hidden", name: "cards"
        input class: 'btn btn-large btn-success', type: "submit", :value => "Bury"
      end
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

end