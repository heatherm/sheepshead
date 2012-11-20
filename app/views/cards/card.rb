class Views::Cards::Card < Erector::Widget
  def content
    div.card style: @style do
      red = (@suit == "&hearts;" || @suit == "&diams;")
      div class: "front #{'red' if red}" do
        div.index do
          rawtext @short_name
          br
          rawtext @suit
        end

        img.face src: @src, alt: @rank if @src

        @spots.each do |spot_class|
          div class: "spot#{spot_class}" do
            rawtext @suit
          end
        end if @spots

        div.ace do
          rawtext @suit
        end if @ace
      end
    end
  end
end

          