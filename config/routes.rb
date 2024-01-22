Rails.application.routes.draw do
	apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		resources :books do
  			collection do 
  				get :search
  			end
  		end
      resources :authors, only: [:index, :show]
  	end
  end
end
