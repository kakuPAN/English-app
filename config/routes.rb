Rails.application.routes.draw do
  root "homes#index"

  resources :sentences
  resources :words
  resources :unknown_words
  resources :meanings
end
