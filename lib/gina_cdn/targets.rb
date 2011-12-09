module GinaCDN
  URL='http://glink.gina.alaska.edu/cdn/libs'
  TARGETS = {
    :extjs => {
      :versions => {
        :default => '4.0.2a',
        :beta => '4.0.2a'
      },
      :development => {
        :js => ['ext-{version}/ext-all-debug.js'],
        :css => ['ext-{version}/resources/css/ext-all.css']
      },
      :production => {
        :js => ['ext-{version}/ext-all.js'],
        :css => ['ext-{version}/resources/css/ext-all.css']
      },
      :test => {
        :js => ['ext-{version}/ext-all-debug.js'],
        :css => ['ext-{version}/resources/css/ext-all.css']
      }
    },
    :proj4js => {
      :versions => { :default => '1.0' },
      :development => {
        :js => ['proj4js-{version}/lib/proj4js.js', 'proj4js-{version}/lib/projCode/merc.js',
                'proj4js-{version}/lib/projCode/aea.js', 'proj4js-{version}/lib/projCode/laea.js',
                'proj4js-{version}/lib/defs/EPSG3572.js', 'proj4js-{version}/lib/defs/EPSG3338.js'],
        :css => []
      },
      :production => {
        :js => ['proj4js-{version}/lib/proj4js.js', 'proj4js-{version}/lib/projCode/merc.js',
                'proj4js-{version}/lib/projCode/aea.js', 'proj4js-{version}/lib/projCode/laea.js',
                'proj4js-{version}/lib/defs/EPSG3572.js', 'proj4js-{version}/lib/defs/EPSG3338.js'],
        :css => []
      }
    },
    :openlayers => {
      :versions => { :default => '2.11' },
      :development => {
        :js => ['OpenLayers-{version}/OpenLayers.js'],
        :css => []
      },
      :production => {
        :js => ['OpenLayers-{version}/OpenLayers.js'],
        :css => []
      }
    }
  }
  
  class Target
    attr_reader :version
    
    def initialize(name, version = nil)
      @lib = ::GinaCDN::TARGETS[name]
      self.version = version
    end
    
    def version=(version)
      if(version.nil?)
        @version = versions[:default]
      elsif version == :beta
        @version = version[:beta]
      else
        @version = version
      end
    end
    
    def js
      versionize files[:js]
    end
    
    def css
      versionize files[:css]
    end
    
    protected
    
    def versionize(items)
      items.collect do |f| 
        File.join(::GinaCDN::URL, f.gsub('{version}', version))
      end
    end
    
    def versions
      @lib[:versions]
    end
    
    def files
      @lib[Rails.env.to_sym]
    end
  end
end