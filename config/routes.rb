Rails.application.routes.draw do
  devise_for :addresses
  devise_for :users
  root to: 'introduction#index'
  resources :toppages,only:[:index]
  resources :usertoppage,only:[:index]
  resources :users, only: [:show, :edit, :update, :destroy]
  
  resources :jobs, except: :show do
    collection do
      get :search
    end
  end

  resources :usertoppage, except: :show do
    collection do
      get :search
    end
  end

  resources :toppages, except: :show do
    collection do
      get :search
    end
  end
  
  resources :mypage, only:[:index, :new]
end
