Rails.application.routes.draw do
  resources :users, only: [:index]

  devise_for :users, path: :user
  
  resources :chats, except: [:index] do
    get :index, to: redirect('/'), on: :collection
  end
  
  resources :messages, only: [:index]
  
  resources :users, only: [] do
    root to: redirect('/')
  end
  
  unauthenticated { root to: redirect('/user/sign_in') }
  authenticated { root to: 'chats#index' }
end
