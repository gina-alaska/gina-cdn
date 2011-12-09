GinaCDN
-------

Gem to setup helper methods for include various js libs hosts in GINA cdn servers.

List of hosted JS Libs
----------------------
  - [Openlayers](http://openlayers.org) (2.11)
  - [proj4js](http://proj4js.org) (1.0)
  - [ExtJS](http://sencha.com) (3.0.0, 3.0.3, 3.1.1, 3.2.0, 3.2.1, 3.3.1, 4.0.2a, 4.0.5, 4.0.6, 4.0.7, 4.1-pr1)

How to install
--------------

Add dependency to Gemfile:

    gem "gina_cdn", :git => "https://github.com/gina-alaska/gina-cdn.git"
    
In your app/helpers/application_helper.rb add

    include GinaCDN::Helpers

Then you can load the cdn hosted library in applicaiton.html.haml (haml rocks) or any view 
by doing

    = cdn_load(:openlayers)
    
