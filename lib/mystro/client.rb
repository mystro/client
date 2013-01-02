require "mystro/client/version"
require "mystro/client/base"

module Mystro
  module Client
    class << self
      def new(server, token=nil)
        Mystro::Client::Base.new(server, token)
      end
    end
  end
end