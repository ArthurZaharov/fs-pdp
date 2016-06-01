Rails.application.routes.draw do
  devise_for :users

  resources :articles, only: %i(index show) do
    resources :comments, only: :create
  end

  resources :user_articles, only: %i(new create edit update destroy)

  resources :authors, only: %i(index show) do
    resources :subscriptions, only: :create
  end
  resources :search_authors, only: :index
  resource :feedback, only: %i(new create)
  resources :user_subscriptions, only: :index

  root to: 'articles#index'

  get "*page", to: "static_pages#show", constraints: { page: :about_us }
end
