module AliveState
  module Configure
    class << self
      attr_accessor :path, :format, :insert_middleware, :version

      def setup
        keys.each do |key|
          instance_variable_set(:"@#{key}", AliveState::Default.send(key))
        end
      end

      def keys
        @keys ||= %i[path format insert_middleware]
      end
    end
  end
end
