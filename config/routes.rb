ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :banners,  :member => { :remove => :get, :deactivate => :post } 
  end
end