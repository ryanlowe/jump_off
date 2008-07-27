class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  before_filter :login_from_cookie
  
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'acd2581d7e3d4c751b9c86b6db8d0699'
  
  filter_parameter_logging :password
end
