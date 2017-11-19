Rails.application.routes.draw do
  resources :lines do
    get :search, :on => :collection
  end

  resources :handlers, :only => [:index]

  root 'lines#index'
end
