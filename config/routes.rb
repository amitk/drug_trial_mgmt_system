# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard#index'
  resources :doctors
  resources :clinics, except: [:show] do
    resources :arms, shallow: true
  end

  resources :studies, only: [:index] do
    collection do
      get :fetch
    end
  end
  resources :sites, only: [:index] do
    collection do
      get :fetch
    end
  end
  resources :arms, only: [] do
    resources :patients, shallow: true do
      member do
        get :feedback
      end
    end
  end
end
