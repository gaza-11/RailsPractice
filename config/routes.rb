Rails.application.routes.draw do
  root 'actors#index'
  resources :actors, only: %i[index destroy edit new create update] do
    collection { get 'search' }
  end

  resources :members, only: %i[destroy edit new create update] do
    collection { get 'delete/:id', to: 'members#delete' }
  end

  resources :sessions, only: %i[create index]
  delete 'sessions/', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
