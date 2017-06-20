Rails.application.routes.draw do
    root "movies#index"
    resources :movies
    
    # get "/movies" => "movies#index"
    # post "/movies" => "movies#create"
    # get "/movies/new" => "movies#new", as: 'new_movie'
    # get "/movies/:id" => "movies#show", as: 'movie'
    # get "/movies/:id/edit" => "movies#edit", as: 'edit_movie'
    # patch "/movies/:id" => "movies#update"  #In Rails, post verb is used to create, patch verb is used to update
end
