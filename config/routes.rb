Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[index show new create destroy] do
    resources :bookmarks, only: %i[new create index destroy]
  end
  root to: 'lists#index'
end
  # no need for Movies controller

  # Defines the root path route ("/")
