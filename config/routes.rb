Rails.application.routes.draw do

  resources :programms
  resources :channels
  resources :episodes
  resources :shows
  resources :show_types
  namespace :api do 

    resources :programm

  end

end
