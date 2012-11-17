#encoding utf-8
class Views::Welcome::Show < Views::Layouts::Page
  def initialize(attr=nil)
    super(:page_title => "Game")
  end

  def main
    div do
      h1 "Welcome to Sheepshead Online"
    end
    div.cardBlock style: "position: relative; height:10em;" do
      div.card style: "left:1em;top:.5em;" do
        div.front do
          div.index do
            rawtext "10"
            br
            rawtext "&spades;"
          end
          div.spotA1 do
            rawtext "&spades;"
          end
          div.spotA2 do
            rawtext "&spades;"
          end
          div.spotA4 do
            rawtext "&spades;"
          end
          div.spotA5 do
            rawtext "&spades;"
          end
          div.spotB2 do
            rawtext "&spades;"
          end
          div.spotB4 do
            rawtext "&spades;"
          end
          div.spotC1 do
            rawtext "&spades;"
          end
          div.spotC2 do
            rawtext "&spades;"
          end
          div.spotC4 do
            rawtext "&spades;"
          end
          div.spotC5 do
            rawtext "&spades;"
          end
        end
      end

      div.card style: "left:4em;top:.25em;" do
        div.front do
          div.index do
            rawtext "J"
            br
            rawtext "&spades;"
          end
          img.face src: "assets/jack.gif", alt: "jack"
          div.spotA1 do
            rawtext "&spades;"
          end
          div.spotC5 do
            rawtext "&spades;"
          end
        end
      end

      div.card style: "left:7em;top:0em;" do
        div.front do
          div.index do
            rawtext "Q"
            br
            rawtext "&spades;"
          end
          img.face src: "assets/queen.gif", alt: "queen"
          div.spotA1 do
            rawtext "&spades;"
          end
          div.spotC5 do
            rawtext "&spades;"
          end
        end
      end

      div.card style: "left:10em;top:.25em;" do
        div.front do
          div.index do
            rawtext "K"
            br
            rawtext "&spades;"
          end
          img.face src: "assets/king.gif", alt: "king"
          div.spotA1 do
            rawtext "&spades;"
          end
          div.spotC5 do
            rawtext "&spades;"
          end
        end
      end

      div.card style: "left:13em;top:.5em;" do
        div.front do
          div.index do
            rawtext "A"
            br
            rawtext "&spades;"
          end
          div.ace do
            rawtext "&spades;"
          end
        end
      end
    end
  end
end
