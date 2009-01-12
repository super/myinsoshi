ActionController::Routing::Routes.draw do |map|
  map.home '', :controller => 'home'
  map.resources :users
  map.resources :accounts
  map.resources :forums do |forums|
    forums.resources :topics do |topics|
      topics.resources :posts
    end
  end
  map.login '/login', :controller => 'account', :action => 'new'
  map.logout '/logout', :controller => 'account', :action => 'destroy'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
