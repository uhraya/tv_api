Rails.application.routes.draw do

  resources :show_types
  namespace :api do 

    resources :programm

  end

end
