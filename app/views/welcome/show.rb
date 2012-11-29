#encoding utf-8
class Views::Welcome::Show < Views::Layouts::Application
  def initialize(attr={})
    super(page_title: "Start")
  end

  def header
    div class: 'btn btn-large btn-info' do
      link_to "Start Playing!", start_path
    end
  end

  def main
    div.row do
      div.span9 do
        ["spades", "hearts", "diamonds", "clubs"].each do |suit|
          div.cardBlock style: "position: relative; height:10em;" do
            positions = [
                "left:1em;top:0em;", "left:3em;top:.25em;", "left:5em;top:0em;",
                "left:7em;top:.25em;", "left:9em;top:0em;", "left:11em;top:.25em;",
                "left:13em;top:0em;", "left:15em;top:.25em;"]

            widget eval("Views::Cards::#{suit.humanize}::Seven.new(style: positions[0])")
            widget eval("Views::Cards::#{suit.humanize}::Eight.new(style: positions[1])")
            widget eval("Views::Cards::#{suit.humanize}::Nine.new(style: positions[2])")
            widget eval("Views::Cards::#{suit.humanize}::King.new(style: positions[3])")
            widget eval("Views::Cards::#{suit.humanize}::Ten.new(style: positions[4])")
            widget eval("Views::Cards::#{suit.humanize}::Ace.new(style: positions[5])")
            widget eval("Views::Cards::#{suit.humanize}::Jack.new(style: positions[6])")
            widget eval("Views::Cards::#{suit.humanize}::Queen.new(style: positions[7])")
          end
        end
      end
    end
  end
end
