module AliveState
  class Application
    attr_reader :name

    def initialize(name, &block)
      @name = name
      @block = block
    end

    def alive?
      @block.call
    rescue
      false
    else
      true
    end
  end
end
