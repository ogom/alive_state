module AliveState
  module Default
    PATH = 'status'.freeze
    FORMAT = 'json'.freeze
    InsertMiddleware = true.freeze
    VERSION = ''.freeze

    class << self
      def options
        Hash[AliveState::Configure.keys.map{|key| [key, send(key)]}]
      end

      def path
        PATH
      end

      def format
        FORMAT
      end

      def insert_middleware
        InsertMiddleware
      end

      def version
        VERSION
      end
    end
  end
end
