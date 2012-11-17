class Views::Layouts::Page < Erector::Widget
  def content
    html {
      head {
        title "Sheepshead - #{@page_title}"
        css "assets/application.css"
      }
      body {
        div.main {
          main
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

  def footer
    div.footer do
      p "Copyright (c) 2012, Heather Moore"
    end
  end
end