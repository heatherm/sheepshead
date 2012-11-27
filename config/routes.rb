Sheepshead::Application.routes.draw do
  devise_for :players

  match 'start', to: 'game#show'
  root to: "welcome#show"
end
