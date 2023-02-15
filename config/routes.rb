Rails.application.routes.draw do
  root to: 'rentals#index'
  resources :properties do
    collection do
      post :confirm
    end
  end
  resources :nearest_stations
end
