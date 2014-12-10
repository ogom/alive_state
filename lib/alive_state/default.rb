module AliveState
  module Default
    PATH = 'status'.freeze
    FORMAT = 'json'.freeze
    FRONT = true.freeze

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

      def front
        FRONT
      end
    end
  end
end
