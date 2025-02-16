Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bachelorettes, only: [:index, :show] do 
    resources :contestants, only: [:index, :show] 
  end
  
  resources :contestants, only: [:index, :show] 
  
  resources :outings, only: [:index, :show]
  
  post '/contestant_outings/delete/:contestant_id/:outing_id', to: 'contestant_outings#destroy'
end
