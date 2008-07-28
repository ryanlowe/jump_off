class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  protect_from_forgery :secret => 'acd258158b2d4c7512d446b6db771e99'  
  filter_parameter_logging :password
  
end
