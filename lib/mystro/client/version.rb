unless defined?(Mystro::Client::Version)
  module Mystro
    module Client
      module Version
        MAJOR  = 0
        MINOR  = 2
        TINY   = 0
        TAG    = nil
        STRING = [MAJOR, MINOR, TINY, TAG].compact.join('.')
      end
    end
  end
end
