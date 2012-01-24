$:.push File.expand_path("../lib", __FILE__)

require "gina_cdn"
# Maintain your gem's version:
require "gina_cdn/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gina_cdn"
  s.version     = GinaCDN::VERSION
  s.authors     = ["Will Fisher"]
  s.email       = ["will@gina.alaska.edu"]
  s.homepage    = "http://www.gina.alaska.edu"
  s.summary     = "Loads JS/CSS files from GINA CDN servers"
  s.description = "Loads JS/CSS files from GINA CDN servers"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.3"

  s.add_development_dependency "sqlite3"
end
