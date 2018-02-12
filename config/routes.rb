Rails.application.routes.draw do
  resources :trains do
    resources :carriages, only: [:create, :new, :show]
    resources :coupe_carriage, controller: 'carriages', type: 'CoupeCarriage', only: [:create, :new, :show]
    resources :econom_carriage, controller: 'carriages', type: 'EconomCarriage', only: [:create, :new, :show]
    resources :sedentary_carriage, controller: 'carriages', type: 'SedentaryCarriage', only: [:create, :new, :show]
    resources :sleep_carriage, controller: 'carriages', type: 'SleepCarriage', only: [:create, :new, :show]
  end
  resources :stations do
    patch :update_position, on: :member
  end
  resources :routes
end
