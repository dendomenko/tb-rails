Rails.application.routes.draw do
  resources :trains
  resources :stations
  resources :routes
  resources :carriages, only: [:create, :new, :show  ]
  resources :coupe_carriage, controller: 'carriages', type: 'CoupeCarriage', only: [:create, :new, :show]
  resources :econom_carriage, controller: 'carriages', type: 'EconomCarriage', only: [:create, :new, :show]
  resources :sedentary_carriage, controller: 'carriages', type: 'SedentaryCarriage', only: [:create, :new, :show]
  resources :sleep_carriage, controller: 'carriages', type: 'SleepCarriage', only: [:create, :new, :show]
end
