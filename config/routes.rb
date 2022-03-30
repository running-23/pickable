Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users, only: %i[edit show update]
  resources :categories
  resources :events do
    get :participations, on: :collection
    resource :participation, only: %i[create destroy]
  end

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  delete 'logout', to: 'user_sessions#destroy'
end
