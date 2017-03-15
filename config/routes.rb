Rails.application.routes.draw do
  root 'actors#index'
  resources :actors, only: [:index, :destroy, :edit, :new, :create, :update] do
    collection {get 'search'}
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
