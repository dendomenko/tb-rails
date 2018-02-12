Rails.application.routes.draw do
  resources :trains
  resources :stations
  resources :routes
  resources :carriages, only: [:create, :new]
end
