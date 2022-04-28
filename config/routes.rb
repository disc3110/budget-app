Rails.application.routes.draw do
  devise_for :users
  
  resources :groups, only: [:index, :show, :new, :create] do
    resources :deals, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  authenticated do
    root :to => 'groups#index', as: :authenticated_root
  end
  root "application#index"

end
