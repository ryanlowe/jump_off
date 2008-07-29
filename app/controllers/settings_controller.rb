class SettingsController < ApplicationController

  before_filter :login_required
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :update_preferences, :update_password ],
         :redirect_to => { :controller => 'site', :action => 'front' }
  
  # def preferences
  #   @pref_store = current_user.pref_store
  #   @pref_store = PrefStore.new if @pref_store.nil?
  #   @title = "Preferences"
  #   @omit_h1 = true
  # end
  # 
  # def update_preferences
  #   @pref_store = current_user.pref_store
  #   if @pref_store.nil?
  #     @pref_store = PrefStore.new
  #     @pref_store.user_id = current_user.id
  #     @pref_store.save
  #   end
  #   if @pref_store.update_attributes(params[:pref_store])
  #     flash[:notice] = 'Your preferences were successfully saved.'
  #     redirect_to :action => 'preferences'
  #   else
  #     render :action => 'preferences'
  #   end
  # end
  
  def change_password
    @title = "Change Your Password"
  end
  
  def update_password
    user = current_user
    if params[:user].nil? or params[:user][:password].to_s.length < 1 or params[:user][:password_confirmation].to_s.length < 1
      flash[:notice] = 'Neither password can be blank.'
      redirect_to :action => 'change_password' and return
    end
    user.password = params[:user][:password]
    user.password_confirmation = params[:user][:password_confirmation]
    if user.save
      flash[:notice] = 'Your password was successfully changed.'
      redirect_to :action => 'change_password'
    else
      flash[:notice] = 'The passwords did not match.'
      redirect_to :action => 'change_password'
    end
  end
  
end
