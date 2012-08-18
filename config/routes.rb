Tapp::Application.routes.draw do
  root :to => "main#index"

  resources :campaigns
  resources :brands do
    resources :campaigns, :only => [ :index ]
  end
  resources :companies
end
