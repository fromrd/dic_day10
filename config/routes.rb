Rails.application.routes.draw do
  get 'users/sign_up', to: 'users#new'
  get 'users/sign_in', to: 'sessions#new'
  post 'users/sign_in', to: 'users#show'
  get '/mypage', to: 'users#show'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:create, :show, :edit, :update]
  resources :blogs
  resources :tops
  root to: "tops#index"
end
