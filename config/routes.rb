Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, only: [:index, :show]
  root 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
