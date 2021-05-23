Rails.application.routes.draw do
  resources :memos
  resources :locations
  resources :consultation_hours
  resources :clinics
  resources :departments
  devise_for :users
  root 'home#index'
end
