Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :news, only: [:index, :show]
  resources :staff, only: [:index, :show]
  resources :tags, only: [:index, :show]
  
  namespace :workspace do
    resources :articles do
      resources :editor_revisions, only: [:index]
    end
    resources :article_updates
    resources :editor_revisions
    resources :employees do
      resources :articles, only: [:index]
    end
    resources :roles, except: [:show]
    resources :tags, only: [:index, :destroy]
    root to: "articles#index"
  end
  
  post "/logout", to: "sessions#destroy", as: "logout"
  get "/login", to: "sessions#new", as: "login"
  get "/auth/github/callback" => "sessions#create"
  root to: "news#index"
  
end
