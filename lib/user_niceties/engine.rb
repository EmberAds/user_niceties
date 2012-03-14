require 'rails'
require File.expand_path(File.join(File.dirname(__FILE__), '../user_niceties'))

module UserNiceties
  class Engine < Rails::Engine
    path = File.expand_path(File.join(File.dirname(__FILE__), '../..'))

    config.autoload_paths << File.join(path, 'lib')
    config.autoload_once_paths << File.join(path, 'lib')

    # generators do
    #   require File.join(pingbacks_path, 'generators/pingback/pingback_generator')
    # end
  end
end