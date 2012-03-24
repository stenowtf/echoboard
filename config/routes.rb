Echoboard::Application.routes.draw do

  resources :teams
  resources :projects

  match '/help', to: 'pages#help'
  root :to => 'pages#home'

end
