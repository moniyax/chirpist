Rails.application.routes.draw do
  resources :reposts
  resources :likes
  root 'posts#index'
  resources :posts
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :relationships, only: [:index, :create, :destroy] do
    collection do
      get 'who_to_follow'
      get 'followers'
      get 'followings'
    end
  end
  get '/:username', to: 'posts#user_timeline', as: :user_timeline
end
