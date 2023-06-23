Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :patient_records do
    resources :attachments
    resources :comments
    resources :treatments do
      resources :drugs
    end
    member do
      put :assign_to_doctor
    end
  end
  resources :general_drugs

  resources :my_patients
  resources :home, only: [:index]

  namespace :patient do
    resources :patient_records do
      resources :treatments, only: [:show]
    end
  end

  namespace :nurse do
    resources :general_drugs
    resources :my_patients
    resources :patient_records do
      resources :attachments
      resources :comments
      resources :treatments do
        resources :drugs
      end
      member do
        put :assign_to_nurse
      end
    end
  end

  root "home#index"
end
