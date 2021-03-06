require 'active_support/all'
require "httparty"

require 'mystro-common'
require "mystro/client/version"
require "mystro/client/cli"

module Mystro
  module Client
    class << self
      def new(klass, server, organization, token=nil)
        k = "Mystro::Client::#{klass.to_s.capitalize}".constantize
        k.new(server,organization,token)
      rescue => e
        Mystro::Log.error "class #{klass} not found or error instantiating"
        Mystro::Log.debug e
        raise "class #{klass} not found or error instantiating, #{e.message}"
      end
    end

    class Base
      include HTTParty

      def initialize(server, organization, token=nil)
        @server  = server
        @token   = token
        @organization = organization
      end

      private

      def baseurl
        HTTParty.normalize_base_uri(@server)
      end

      def url(uri)
        "#{baseurl}/#{uri}?token=#@token"
      end

      def api_get(u)
        api_call(:get, u)
      end

      def api_post(u, data, headers={ })
        api_call(:post, u, data, headers)
      end

      def api_delete(u)
        api_call(:delete, u)
      end

      def api_call(m, u, data={}, headers={})
        raise "organization must be set" unless @organization
        method = m.to_sym
        url = url("api/organizations/#@organization/#{u}")

        Mystro::Log.debug "<= #{url}"
        Mystro::Log.debug "=> #{data}" if data && data.count > 0

        r   = self.class.send(method, url, body: data.to_json, headers: { 'Content-Type' => 'application/json' }.merge(headers))
        Mystro::Log.debug "== #{r.response.class} #{r.response.code} #{r}"

        api_response_error?(r.response)

        if r.body
          JSON.parse(r.body)
        else
          {}
        end
        #rescue => e
        #  { error: e.message, backtrace: e.backtrace }
      end

      def api_response_error?(r)
        raise "client error, #{r.code}\n#{r.body}" if r.is_a?(Net::HTTPClientError)
        raise "server error, #{r.code}\n#{r.body}" if r.is_a?(Net::HTTPServerError)
        raise "unknown error, #{r.code}\n#{r.body}" if r.is_a?(Net::HTTPUnknownResponse)
      end
    end
  end
end

require "mystro/client/compute"
require "mystro/client/environment"
require "mystro/client/template"
require "mystro/client/organization"