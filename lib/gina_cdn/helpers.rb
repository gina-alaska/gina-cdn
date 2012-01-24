module GinaCDN
  module Helpers
    def cdn_load(lib, h={})
      css = cdn_include_css(lib, h.dup)
      js = cdn_include_js(lib, h.dup)
      css + js
    end
    
    def cdn_include_js(lib, h={})
      version = h.delete :version
      
      javascript_include_tag( *target(lib, version).js, *h )
    end
    
    def cdn_include_css(lib, h={})
      version = h.delete :version
      stylesheet_link_tag( *target(lib, version).css, *h )
    end
    
    def cdn_js_path(lib, version=nil)
      target(lib, version).js
    end
    
    def cdn_css_path(lib, version=nil)
      target(lib, version).css
    end
    
    protected
    
    def target(lib, version)
      @targets ||= {}
      
      @targets["#{lib}-#{version}"] ||= GinaCDN::Target.new(lib, version)
      @targets["#{lib}-#{version}"]
    end
  end
end