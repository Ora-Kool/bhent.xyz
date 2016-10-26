Rails.application.routes.draw do
    root 'home#index'
    
    get    '/bhent/admin/login',   to: 'sessions#new'
  	post   '/login',   to: 'sessions#create'
  	delete '/logout',  to: 'sessions#destroy'
  	get '/admin/signup', to: 'admins#new'
  	post '/admin/signup', to: 'admins#create'
  	get '/blog', to: 'home#blog'
    get '/agency', to: 'home#agency'
    get '/portfolio', to: 'home#portfolio'
    get '/support', to: 'home#support'

    get '/blog/:id', to: 'blogs#details', as: "more_details"

  

  
  resources :admins do
    resources :blogs
  end
  	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
