Sheepshead::Application.routes.draw do
  devise_for :players

  match 'start', to: 'game#show'
  match 'pick', to: 'game#pick'
  match 'pass', to: 'game#pass'
  match 'bury', to: 'game#bury'
  match 'play', to: 'game#play'
  root to: "welcome#show"
end
