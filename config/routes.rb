ActionController::Routing::Routes.draw do |map|
  map.home '', :controller => 'home'
  map.resources :users do |user|
    user.resources :blogs
    user.resources :comments, :member => { :wallcomment => :get }
    user.resources :messages
  end
  map.resources :blogs do |blog|
    blog.resources :comments
  end
  map.resources :accounts
  map.resources :forums do |forums|
    forums.resources :topics do |topics|
      topics.resources :posts
    end
  end
  map.sendmessage '/message', :controller => 'messages', :action => 'new'
  map.new '/new', :controller => 'blogs', :action => 'new'
  map.login '/login', :controller => 'account', :action => 'new'
  map.logout '/logout', :controller => 'account', :action => 'destroy'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
