Rails.application.routes.draw do
  root 'clinics#index'
  
  resources :clinics do
    resources :announcements
    collection do
      get 'search'
    end
  end

  resources :area, only: [:index, :show]
  resources :departments
  resources :locations
  resources :consultation_hours
  devise_for :users
  resources :users, only: [:show]
end
