Sheepshead::Application.routes.draw do
  resources :game
  root to: "game#home"
end
