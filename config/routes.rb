Offerr::Application.routes.draw do

  resources :items
  
  root 'items#index'

end