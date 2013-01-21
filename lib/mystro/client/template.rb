module Mystro
  module Client
    class Template < Base
      def list
        api_get("templates")
      end
    end
  end
end