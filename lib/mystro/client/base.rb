require "httparty"
module Mystro
  module Client
    class Base
      include HTTParty

      def initialize(server, token=nil)
        @server = server
        @token = token
      end

      def baseurl
        HTTParty.normalize_base_uri(@server)
      end

      def url(uri)
        "#{baseurl}/#{uri}?token=#@token"
      end

      def compute_search(pattern)
        r = self.class.get(url("computes/search/#{pattern}"))
        JSON.parse(r.body)
      end
    end
  end
end