Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :items, only: [:show, :new, :create, :edit, :update] do
    resources :bookings, except: [:show]
  end
end
