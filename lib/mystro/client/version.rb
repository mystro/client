unless defined?(Mystro::Client::Version)
  module Mystro
    module Client
      module Version
        MAJOR = 0
        MINOR = 3
        TINY = 2
        TAG = nil
        STRING = [MAJOR, MINOR, TINY, TAG].compact.join('.')
      end
    end
  end
end