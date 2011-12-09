# gina_cdn/test/targets_test.rb

require 'test_helper'

class TargetsTest < Test::Unit::TestCase
  include GinaCDN
  
  def test_cdn_url
    assert_equal "http://glink.gina.alaska.edu/cdn/libs", URL
  end
  
  def test_target_list
    assert_kind_of Hash, TARGETS
    
    GinaCDN::TARGETS.each do |k,v|
      assert_not_nil v[:versions], "#{k}[:versions] was nil"
      assert_not_nil v[:development][:js], "#{k}[:development][:js] was nil"
      assert_not_nil v[:development][:css], "#{k}[:development][:css] was nil"
      assert_not_nil v[:production][:js], "#{k}[:production][:js] was nil"
      assert_not_nil v[:production][:css], "#{k}[:production][:css] was nil"
    end
  end
  
  def setup_target(v = nil)
    @target = Target.new(:extjs, v)
  end
  
  def test_target_default_version
    setup_target
    
    assert_equal '4.0.2a', @target.version
  end
  
  def test_target_default_files
    setup_target
    
    assert_equal "http://glink.gina.alaska.edu/cdn/libs/ext-4.0.2a/ext-all-debug.js", @target.js.first
    assert_equal "http://glink.gina.alaska.edu/cdn/libs/ext-4.0.2a/resources/css/ext-all.css", @target.css.first
  end
  
  def test_new_target_given_version
    setup_target('4.1pr1')
    
    assert_equal "http://glink.gina.alaska.edu/cdn/libs/ext-4.1pr1/ext-all-debug.js", @target.js.first
    assert_equal "http://glink.gina.alaska.edu/cdn/libs/ext-4.1pr1/resources/css/ext-all.css", @target.css.first    
  end
end