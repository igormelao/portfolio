Rails.application.routes.draw do
  
  devise_for :users
  
  resources :book_works, except: [:show]

  get 'book_work/:id', to: 'book_works#show', as: 'book_work_show'
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#about'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  root to: 'pages#home'
end
