Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  root to: "games#new"

  resources :games, only: [:new, :create] do
    resources :players, only: [:index, :new, :create]
    resource :scorecard, only: [:show, :create]
  end
end
