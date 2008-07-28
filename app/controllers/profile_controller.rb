class ProfileController < ApplicationController

  before_filter :login_required

  def user
    @user = User.find_by_login(params[:login])
    raise ActiveRecord::RecordNotFound if @user.nil?
    @title = @user.login
  end

  def list
    @users = User.find(:all, :order => 'login ASC')
    @title = "People"
  end

end
