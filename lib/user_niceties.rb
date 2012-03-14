require "user_niceties/version"

module UserNiceties

end

Dir[File.expand_path("user_niceties/**/*.rb", File.dirname(__FILE__))].each { | f | require f }
