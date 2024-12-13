Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  resources :subjects do
    collection do
      get 'edit', to: 'subjects#edit', as: 'edit'
    end
  end
  resources :graduation_requirements, only: [:new, :create, :edit, :update]
end
