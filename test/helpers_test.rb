# gina_cdn/test/helpers_test.rb

require 'test_helper'

class HelpersTest < Test::Unit::TestCase  
  include GinaCDN::Helpers
  
  def test_cdn_js_path
    assert_kind_of Array, cdn_js_path(:extjs)
  end
  
  def test_cdn_css_path
    assert_kind_of Array, cdn_css_path(:extjs)
  end
  
  def test_cdn_include_js
    output = cdn_include_js(:extjs)
    
    assert_kind_of Array, output
    assert_equal ["http://glink.gina.alaska.edu/cdn/libs/ext-4.0.2a/ext-all-debug.js"], output
  end
  
  def test_cdn_include_js_with_version
    output = cdn_include_js(:extjs, :version => '4.1pr1')
    
    assert_kind_of Array, output
    assert_equal ["http://glink.gina.alaska.edu/cdn/libs/ext-4.1pr1/ext-all-debug.js"], output
  end
  
  def test_cdn_include_css
    output = cdn_include_css(:extjs)
    
    assert_kind_of Array, output
    assert_equal ["http://glink.gina.alaska.edu/cdn/libs/ext-4.0.2a/resources/css/ext-all.css"], output
  end
  
  def test_cdn_include_css_with_version
    output = cdn_include_css(:extjs, :version => '4.1pr1')
    
    assert_kind_of Array, output
    assert_equal ["http://glink.gina.alaska.edu/cdn/libs/ext-4.1pr1/resources/css/ext-all.css"], output
  end
  
  def test_cdn_load
    expected = [
      "http://glink.gina.alaska.edu/cdn/libs/ext-4.0.2a/resources/css/ext-all.css",
      "http://glink.gina.alaska.edu/cdn/libs/ext-4.0.2a/ext-all-debug.js"];
    output = cdn_load(:extjs)
    
    assert_kind_of Array, output
    assert_equal expected, output
  end
  
  def test_cdn_load_with_version
    expected = [
      "http://glink.gina.alaska.edu/cdn/libs/ext-4.1pr1/resources/css/ext-all.css",
      "http://glink.gina.alaska.edu/cdn/libs/ext-4.1pr1/ext-all-debug.js"];
    output = cdn_load(:extjs, :version => '4.1pr1')
    
    assert_kind_of Array, output
    assert_equal expected, output
  end
  
  # Don't need to test ActiveSupport Helper methods, just make sure we send the right things off to it
  def javascript_include_tag(*h)
    h
  end
  
  def stylesheet_link_tag(*h)
    h
  end
end