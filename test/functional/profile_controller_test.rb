require File.dirname(__FILE__) + '/../test_helper'

class ProfileControllerTest < ActionController::TestCase
  fixtures :users
  
  def test_routing
    assert_routing '/person/ryanlowe', :controller => 'profile', :action => 'user', :login => 'ryanlowe'
    assert_routing '/people',          :controller => 'profile', :action => 'list'
  end
  
  #
  # user
  #
  
  def test_user
    login_as :jonny
    
    get :user, :login => users(:ryanlowe).login
    
    assert_response :success
    assert_template 'user'
    assert_equal users(:ryanlowe), assigns(:user)
  end
  
  def test_user_does_not_exist
    login_as :jonny
    assert_nil User.find_by_login('stu')
  
    assert_raises(ActiveRecord::RecordNotFound) {
      get :user, :login => 'stu'
    }
  end
  
  def test_user_login_missing
    login_as :jonny
  
    assert_raises(ActionController::RoutingError) {
      get :user
    }
  end
  
  def test_user_not_logged_in
    get :user, :login => users(:ryanlowe).login
    
    assert_response :redirect
    assert_redirected_to login_url
  end
  
  #
  # list
  #
  
  def test_list
    login_as :jonny
    
    get :list
    
    assert_response :success
    assert_template 'list'
    assert_equal User.count, assigns(:users).size
  end
  
  def test_list_not_logged_in
    get :list
    
    assert_response :redirect
    assert_redirected_to login_url
  end
  
end
