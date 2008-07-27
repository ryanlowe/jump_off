require 'test/unit'
require File.dirname(__FILE__) + '/../lib/client_date'

class ClientDateTest < Test::Unit::TestCase
  include ClientDate

  #
  # format_date
  #

  def test_format_date
    assert_equal "", format_date(nil)
    assert_equal "<script>fd(2000,1,1,20,15,39);</script>", format_date(Time.gm(2000,"jan",1,20,15,39))
  end
  
  #
  # format_datetime
  #
  
  def test_format_datetime
    assert_equal "", format_datetime(nil)
    assert_equal "<script>fdt(2000,1,1,20,15,47);</script>", format_datetime(Time.gm(2000,"jan",1,20,15,47))
  end
  
  def test_format_datetime_with_seconds
    assert_equal "", format_datetime(nil,true)
    assert_equal "<script>fdts(2000,1,1,20,15,23);</script>", format_datetime(Time.gm(2000,"jan",1,20,15,23),true)
  end
  
end