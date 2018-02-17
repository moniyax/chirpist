Rails.application.routes.draw do
  resources :relationships
  root 'posts#index'
  get '/:username', to: 'posts#user_timeline', as: :timeline
  resources :posts
  devise_for :users, :controllers => { registrations: 'registrations' }
  # resources :relationships, only: [:create, :destroy]
end
