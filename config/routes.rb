Rails.application.routes.draw do
  resources :departamentos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Resource routes
    resources :produtos, only: [:new, :create, :destroy]
  
  #GET routes
    get "/produtos/find" => "produtos#find", as: :find_produto
  
  #ROOT route
    root "produtos#index"
end
