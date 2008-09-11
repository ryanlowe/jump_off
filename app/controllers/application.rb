class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include ExceptionNotifiable
  helper :messages
  
  # protect against forged cross-site scripting attacks
  protect_from_forgery :secret => 'acd258158b2d4c7512d446b6db771e99'  
  
  # don't show passwords in the clear in logs
  filter_parameter_logging :password
  
  # return 404 to unauthenticated requests for public pages until launch
  before_filter :launch_required
  
  # for admin views
  prepend_view_path(RAILS_ROOT+"/app/views/admin")
  
  # use Eastern Time by default
  before_filter :set_time_zone
  
  protected
  
    def set_time_zone
      Time.zone = "Eastern Time (US & Canada)"
    end
  
end
