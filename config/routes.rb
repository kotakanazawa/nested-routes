Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    resources :logs, only: %i(new create update)
  end
  resources :logs, only: %i(show destroy edit)

  resources :projects do
    resources :todos, only: %i(new create update)
  end
  resources :todos, except: %i(index new create update)

  resources :users do
    resources :books, only: %i(new edit create update)
  end
  resources :books, only: %i(show destroy)
end
