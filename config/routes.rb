Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'clinics#index'
  
  get 'home/index'
  resources :clinics do
    get 'download',to: "clinics#download",as: "download"
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
