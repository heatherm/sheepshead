Sheepshead::Application.routes.draw do
  devise_for :players

  match 'start', to: 'game#show'
  match 'pick', to: 'game#pick'
  match 'pass', to: 'game#pass'
  root to: "welcome#show"
end
