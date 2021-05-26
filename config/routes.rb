Rails.application.routes.draw do
  root 'home#index'
  
  resources :clinics do
    resources :memos
  end

  resources :area, only: [:index, :show]
  resources :departments
  resources :locations
  resources :consultation_hours
  devise_for :users
end
