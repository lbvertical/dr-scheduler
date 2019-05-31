Rails.application.routes.draw do
  get 'appointments/index'
  get 'appointments/show'
  get 'appointments/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'patients#index'

  resources :doctors
  resources :patients
end
