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
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :users, only: [:show]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

end
