module Mystro
  module Client
    class Environment < Base
      def list
        api_get("environments")
      end

      def show(id)
        api_get("environments/#{id}")
      end

      def create(name, template, protected)
        api_post("environments", { name: nil, template: nil, protected: protected })
      end

      def destroy(id)
        api_delete("environments/#{id}")
      end
    end
  end
end