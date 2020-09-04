Rails.application.routes.draw do
  devise_for :addresses
  devise_for :users
  root to: 'introduction#index'
  resources :toppages,only:[:index]
  resources :usertoppage,only:[:index]
  resources :users, only: [:show, :edit, :update, :destroy]
  
  resources :jobs do
    collection do
      get :search
    end
  end

  resources :usertoppage do
    collection do
      get :search
    end
  end

  resources :toppages do
    collection do
      get :search
    end
  end
  
  resources :mypage, only:[:index, :new]
end
