Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'searches#show'
  resource :search, only: :show do
    post '/', to: 'searches#search_route'
  end
  
  resources :tickets, only: [:index]

  resources :trains, only: [] do
    resources :tickets, except: %i[index edit update]
  end

  namespace :admin do
    resources :trains do
      resources :carriages, only: %i[create new show]
      resources :coupe_carriage, controller: 'carriages',
                                 type: 'CoupeCarriage',
                                 only: %i[create new show]
      resources :econom_carriage, controller: 'carriages',
                                  type: 'EconomCarriage',
                                  only: %i[create new show]
      resources :sedentary_carriage, controller: 'carriages',
                                     type: 'SedentaryCarriage',
                                     only: %i[create new show]
      resources :sleep_carriage, controller: 'carriages',
                                 type: 'SleepCarriage',
                                 only: %i[create new show]

      resources :tickets, only: %i[create new show]
    end

    resources :stations do
      patch :update_number, on: :member
    end

    resources :routes
  end
end
