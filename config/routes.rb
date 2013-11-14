Spek::Application.routes.draw do

  api :version => 1 do
    resources :messages, only: [:index, :show, :create, :destroy] do 
      resource :likes, only: [:show, :create, :destroy]
      resource :impressions, only: [:create]
      collection do 
        get 'friends'
        get 'everyone'
      end
    end 
    resource :session, only: [:create]
    resources :users, only: [:show, :create, :destroy] do
      resources :messages, only: [:index]
      member do
        get 'likes'
      end
    end
    resource :relationships
  end

  devise_for :users

  mount_opro_oauth


end
