Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :categories
  resources :events
  
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  get 'login', to: 'user_sessions#new'
  delete 'logout', to: 'user_sessions#destroy'
end
