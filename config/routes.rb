Spek::Application.routes.draw do
  
  api :version => 1 do
    resources :messages do 
      resource :likes
    end 
    resource :session
    resources :users
  end

end
