class Views::Layouts::Application < Erector::Widget
  def content
    html {
      head {
        title "Sheepshead - #{@page_title}"
        css "assets/application.css"
        javascript_include_tag "application.js"
      }
      body {
        div.container {
          div.page_header {
            h1 "Sheepshead"
            p.lead {
              header
            }
          }
          div.main {
            main
          }
          div.push
        }
        div.footer {
          footer
        }
      }
    }
  end

  def main
    p "This page intentionally left blank."
  end

  def header
    "Can you beat 4 computers in a game of 5-handed?"
  end

  def footer
    div.container do
      p.muted.credit do
        text "Copyright (c) 2012, "
        a "Heather Moore", href: "http://www.heathrmoor.com"
      end
    end
  end
end