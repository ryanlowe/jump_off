ActionController::Routing::Routes.draw do |map|

  #site
  map.with_options :controller => "site" do |site|
    site.connect '/boom', :action => 'boom'
    site.front   '/',     :action => 'front'
  end
  
  #account
  map.with_options :controller => "account" do |account|
    account.connect '/account', :action => 'index'
    account.login   '/login',   :action => 'login'
    account.signup  '/signup',  :action => 'signup'
    account.logout  '/logout',  :action => 'logout'
  end

end
