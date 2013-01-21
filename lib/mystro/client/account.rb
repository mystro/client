module Mystro
  module Client
    class Account < Base
      def list
        api_get("accounts")
      end
    end
  end
end