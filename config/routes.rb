Sheepshead::Application.routes.draw do
  devise_for :players

  root to: "welcome#show"
end
