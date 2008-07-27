require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  fixtures :users
  
  def test_fixtures
    assert users(:ryanlowe).valid?
    assert users(:jonny).valid?
  end

  def test_should_create_user
    assert_difference User, :count do
      user = create_user
      assert !user.new_record?, "#{user.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_login
    assert_no_difference User, :count do
      u = create_user(:login => nil)
      assert u.errors.on(:login)
    end
  end

  def test_should_require_password
    assert_no_difference User, :count do
      u = create_user(:password => nil)
      assert u.errors.on(:password)
    end
  end

  def test_should_require_password_confirmation
    assert_no_difference User, :count do
      u = create_user(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end

  def test_should_require_email
    assert_no_difference User, :count do
      u = create_user(:email => nil)
      assert u.errors.on(:email)
    end
  end

  def test_should_reset_password
    users(:ryanlowe).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal users(:ryanlowe), User.authenticate('ryanlowe', 'new password')
  end

  def test_should_not_rehash_password
    users(:ryanlowe).update_attributes(:login => 'ryanlowe2')
    assert_equal users(:ryanlowe), User.authenticate('ryanlowe2', 'test')
  end

  def test_should_authenticate_user
    assert_equal users(:ryanlowe), User.authenticate('ryanlowe', 'test')
  end

  def test_should_set_remember_token
    users(:ryanlowe).remember_me
    assert_not_nil users(:ryanlowe).remember_token
    assert_not_nil users(:ryanlowe).remember_token_expires_at
  end

  def test_should_unset_remember_token
    users(:ryanlowe).remember_me
    assert_not_nil users(:ryanlowe).remember_token
    users(:ryanlowe).forget_me
    assert_nil users(:ryanlowe).remember_token
  end

  protected
    def create_user(options = {})
      User.create({ :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire' }.merge(options))
    end
end
