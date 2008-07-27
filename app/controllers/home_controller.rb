class HomeController < ApplicationController
  
  before_filter :login_required
  
  def index
    @title = "Home"
  end
  
end
