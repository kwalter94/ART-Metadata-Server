Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :dosages
  resources :moh_names
  resources :regimens
  resources :regimen_combinations, path: 'combinations'

  root to: 'regimens#index'
end
