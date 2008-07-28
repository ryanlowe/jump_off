module ProfileHelper
  def link_profile(user)
    link_to h(user.login), :controller => 'profile', :action => 'user', :login => user.login
  end
end
