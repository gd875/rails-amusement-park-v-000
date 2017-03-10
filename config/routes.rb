Rails.application.routes.draw do
    resources :users
    resources :attractions
    resources :rides
    root 'users#index'
    get '/signin', to: 'users#signin'
    post '/new_session', to: 'sessions#create'
    delete '/signout', to: 'sessions#destroy'

end