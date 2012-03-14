require 'user_niceties'
require 'activerecord'

Dir[File.expand_path("../app/**/*.rb", File.dirname(__FILE__))].each { | f | require f }
