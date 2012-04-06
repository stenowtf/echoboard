Echoboard::Application.routes.draw do

  resources :projects do
    resources :stories do
      resources :tasks
    end
    resources :iterations
  end

  resources :teams

  match '/help', to: 'pages#help'
  root :to => 'pages#home'

end
