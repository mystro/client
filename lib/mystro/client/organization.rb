module Mystro
  module Client
    class Organization < Base
      def list
        api_get("organizations")
      end
    end
  end
end