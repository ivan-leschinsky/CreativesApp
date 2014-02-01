Creativ::Application.routes.draw do
  root "creatives#index"

  get 'tags', to: 'tags#index'
  
  resources :creatives do
    resources :chapters
    resources :pictures
    resources :comments
  end

  get 'creatives/:id/read' => 'creatives#read', :as => :read_creative
  post 'creatives/:id/reorder' => 'creatives#reorder', :as => :reorder
  post 'creatives/:creative_id/pictures/:id/crop' => 'pictures#crop', :as => :crop_picture
  post 'creatives/:creative_id/pictures/:id/retouch' => 'pictures#retouch', :as => :retouch_picture

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

end
