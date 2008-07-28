class AccountController < ApplicationController

  skip_before_filter :launch_required
  
  def login
    @title = "Log in"
    return unless request.post?
    self.current_user = User.authenticate(params[:username], params[:password])
    if logged_in?
      redirect_back_or_default(home_url)
      flash[:notice] = "Logged in successfully"
    end
  end

  def signup
    @title = "Sign up"
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(home_url)
    flash[:notice] = "Thanks for signing up! You have been logged in."
  rescue ActiveRecord::RecordInvalid
    render :action => 'signup'
  end
  
  def logout
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(front_url)
  end
  
end
