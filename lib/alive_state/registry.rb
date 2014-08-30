module AliveState
  class Registry
    attr_reader :application

    def initialize
      @application = []
    end

    def method_missing(name, *args, &block)
      @application << AliveState::Application.new(name, &block)
    end
  end
end
