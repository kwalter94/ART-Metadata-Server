Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :arvs
  resources :dosages
  resources :moh_names
  resources :regimens
  resources :regimen_combinations, path: 'combinations'

  namespace :metadata do
    get 'openmrs', to: 'openmrs'
    get 'moh', to: 'moh'
  end

  root to: 'regimens#index'
end
