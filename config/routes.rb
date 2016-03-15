Rails.application.routes.draw do
  devise_for :users

  root to: 'articles#index'

  resources :articles, only: %i(index show new create edit update) do
    resources :comments, only: :create
  end

  get "*page", to: "static_pages#show", constraints: { page: :about_us }
end
