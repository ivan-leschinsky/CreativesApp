Creativ::Application.routes.draw do
  root "creatives#index"

  resources :tags
  get 'tags/:tag', to: 'creatives#index', as: :creatives_by_tags
  
  resources :creatives do
    resources :chapters
    resources :pictures
    resources :comments
  end
  get 'creatives/:id/read' => 'creatives#read', :as => :read_creative
  post 'creatives/:id/reorder' => 'creatives#reorder', :as => :reorder

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

end
