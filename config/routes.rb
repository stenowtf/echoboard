Echoboard::Application.routes.draw do

  resources :projects do
    resources :stories do
      resources :tasks
    end
    resources :iterations
  end
  resources :teams

  root to: "pages#home"

end
