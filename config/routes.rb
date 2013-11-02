Spek::Application.routes.draw do
  
  api :version => 1 do
    resources :messages, only: [:index, :show, :create, :destroy] do 
      resource :likes, only: [:show, :create, :destroy]
      resource :impressions, only: [:create]
    end 
    resource :session, only: [:create]
    resources :users, only: [:show, :create, :destroy] do
      resources :messages, only: [:index]
    end
    resource :relationships
  end

end
