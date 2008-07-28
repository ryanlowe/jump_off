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
  
  #home
  map.with_options :controller => "home" do |home|
    home.home '/home', :action => 'index'
  end

  #messages
  map.with_options :controller => "messages" do |messages|
    messages.inbox   '/inbox',                  :action => 'inbox'
    messages.outbox  '/outbox',                 :action => 'outbox'
    messages.trash   '/trash',                  :action => 'trash'
    messages.connect '/incoming/:id',           :action => 'incoming'
    messages.connect '/outgoing/:id',           :action => 'outgoing'
    messages.connect '/send/message/to/:id',    :action => 'new'
    messages.connect '/reply/to/message/:id',   :action => 'reply'
    messages.connect '/create/message/to/:id',  :action => 'create'
    messages.connect '/destroy/incoming/:id',   :action => 'destroy'
    messages.connect '/undestroy/incoming/:id', :action => 'undestroy'
  end
  
  ### PUBLIC AREAS
  
  #profile
  map.with_options :controller => "profile" do |profile|
    profile.connect '/person/:username', :action => 'user'
    profile.people  '/people',           :action => 'list'
  end

end
