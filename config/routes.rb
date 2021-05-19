Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  resources :users, only: %i(index show)
  resources :users do
    member do
      get :followings, :followers
    end
  end
  resources :relationships, only: %i[create destroy]
  root to: 'books#index'
  resources :books
end
