unless defined?(Mystro::Client::Version)
  module Mystro
    module Client
      module Version
        MAJOR  = 0
        MINOR  = 1
        TINY   = 0
        TAG    = "rc3"
        STRING = [MAJOR, MINOR, TINY, TAG].compact.join('.')
      end
    end
  end
end
