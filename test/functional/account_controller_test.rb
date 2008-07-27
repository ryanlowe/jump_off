require File.dirname(__FILE__) + '/../test_helper'

class AccountControllerTest < ActionController::TestCase
  fixtures :users

  def setup
    @controller = AccountController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_login_and_redirect
    post :login, :login => 'ryanlowe', :password => 'test'
    assert session[:user]
    assert_response :redirect
  end

  def test_should_fail_login_and_not_redirect
    post :login, :login => 'ryanlowe', :password => 'bad password'
    assert_nil session[:user]
    assert_response :success
  end

  def test_should_allow_signup
    assert_difference User, :count do
      create_user
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    assert_no_difference User, :count do
      create_user(:login => nil)
      assert assigns(:user).errors.on(:login)
      assert_response :success
    end
  end

  def test_should_require_password_on_signup
    assert_no_difference User, :count do
      create_user(:password => nil)
      assert assigns(:user).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference User, :count do
      create_user(:password_confirmation => nil)
      assert assigns(:user).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference User, :count do
      create_user(:email => nil)
      assert assigns(:user).errors.on(:email)
      assert_response :success
    end
  end

  def test_should_logout
    login_as :ryanlowe
    get :logout
    assert_nil session[:user]
    assert_response :redirect
  end

  # def test_should_remember_me
  #   post :login, :login => 'ryanlowe', :password => 'test', :remember_me => "1"
  #   assert_not_nil @response.cookies["auth_token"]
  # end
  # 
  # def test_should_not_remember_me
  #   post :login, :login => 'ryanlowe', :password => 'test', :remember_me => "0"
  #   assert_nil @response.cookies["auth_token"]
  # end
  # 
  # def test_should_delete_token_on_logout
  #   login_as :ryanlowe
  #   get :logout
  #   assert_equal @response.cookies["auth_token"], []
  # end

  protected
  
    def create_user(options = {})
      post :signup, :user => { :login => 'quire', :email => 'quire@example.com', 
        :password => 'quire', :password_confirmation => 'quire' }.merge(options)
    end
    
    def auth_token(token)
      CGI::Cookie.new('name' => 'auth_token', 'value' => token)
    end
    
    def cookie_for(user)
      auth_token users(user).remember_token
    end
    
end
