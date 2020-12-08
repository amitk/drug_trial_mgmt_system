# frozen_string_literal: true

Rails.application.routes.draw do
  resources :doctors
  resources :clinics do
    resources :arms, shallow: true
  end

  resources :arms, only: [] do
    resources :patients, shallow: true
  end
end
