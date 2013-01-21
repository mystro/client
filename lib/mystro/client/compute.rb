module Mystro
  module Client
    class Compute < Base
      def list
        api_get("computes")
      end

      def search(pattern)
        api_get("computes/search/#{pattern}")
      end

      def show(id)
        api_get("computes/#{id}")
      end

      #def create
      #
      #end

      def destroy(id)
        api_get("computes/#{id}")
      end
    end
  end
end