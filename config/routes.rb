Rails.application.routes.draw do
        
  devise_for :users
  scope "/admin" do
    resources :users  

  
    patch '/users/:id/edit', to: 'users#edit', :as => 'admin/users/edit'

  end

    match '/contacts',     to: 'contacts#new',             via: 'get'
    resources "contacts", only: [:new, :create]
    
    resources :topics do
      resources :posts, except: [:index] 
    end
      resources :posts do
        resources :comments, except: [:index]
          resources :favorites, only: [:create, :destroy]


        post '/up-vote' => 'votes#up_vote', as: :up_vote
        post '/down-vote' => 'votes#down_vote', as: :down_vote

      end
   

  get 'home/about'

  get 'home/membership'

  get 'home/index'

    root to: 'home#index'


end
