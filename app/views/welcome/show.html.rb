#encoding utf-8
class Views::Welcome::Show < Views::Layouts::Page
  def initialize(attr={})
    super(:page_title => "Game")
  end

  def main
    div do
      h1 "Welcome to Sheepshead Online"
    end
    ["spades", "hearts", "diamonds", "clubs"].each do |suit|
      div.cardBlock style: "position: relative; height:10em;" do
        positions = [
            "left:1em;top:0em;", "left:3em;top:.25em;", "left:5em;top:0em;",
            "left:7em;top:.25em;", "left:9em;top:0em;", "left:11em;top:.25em;",
            "left:13em;top:0em;", "left:15em;top:.25em;"]

        render partial: "/cards/#{suit}/seven", locals: {style: positions[0]}
        render partial: "/cards/#{suit}/eight", locals: {style: positions[1]}
        render partial: "/cards/#{suit}/nine", locals: {style: positions[2]}
        render partial: "/cards/#{suit}/king", locals: {style: positions[3]}
        render partial: "/cards/#{suit}/ten", locals: {style: positions[4]}
        render partial: "/cards/#{suit}/ace", locals: {style: positions[5]}
        render partial: "/cards/#{suit}/jack", locals: {style: positions[6]}
        render partial: "/cards/#{suit}/queen", locals: {style: positions[7]}
      end
    end
  end
end
