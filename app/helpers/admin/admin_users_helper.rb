module AdminUsersHelper
  def admin_link_user(user)
    return "" if user.nil?
    link_to user.username, :controller => 'admin_users', :action => 'show', :id => user
  end
end
