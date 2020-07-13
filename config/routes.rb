Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :regimens
  resources :regimen_combinations, path: 'combinations'
  resources :moh_names

  root to: 'regimens#index'
end
