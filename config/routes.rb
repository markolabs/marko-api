Spek::Application.routes.draw do

  api version: 1, module: "v1" do
    resources :messages, only: [:index, :show, :create, :destroy] do 
      resource :likes, only: [:show, :create, :destroy]
      resource :flags, only: [:create]
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

  api version: 2, module: "v2" do
    resources :messages, only: [:index, :show, :create, :destroy] do 
      resource :likes, only: [:show, :create, :destroy]
      resource :flags, only: [:create]
      resource :impressions, only: [:create]
      collection do 
        get 'friends'
        get 'everyone'
      end
    end 
    resource :sessions, only: [:create, :destroy]
    resources :users, only: [:index, :show, :create, :destroy] do
      resources :messages, only: [:index]
      member do
        get 'likes'
      end
    end
    resource :relationships
  end

end
