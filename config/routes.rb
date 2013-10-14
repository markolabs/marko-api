Spek::Application.routes.draw do
  
  api :version => 1 do
    resources :messages
  end

end
