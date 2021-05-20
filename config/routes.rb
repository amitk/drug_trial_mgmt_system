# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard#index'
  resources :doctors
  resources :clinics do
    resources :arms, shallow: true
  end

  resources :studies
  resources :sites
  resources :arms, only: [] do
    resources :patients, shallow: true
  end
end
