require 'alive_state/version'
require 'alive_state/configure'
require 'alive_state/default'
require 'alive_state/info'
require 'alive_state/registry'
require 'alive_state/application'
require 'alive_state/middleware'

module AliveState
  class << self
    def configure
      yield AliveState::Configure
    end

    def config
      AliveState::Configure
    end

    def application(&block)
      registry = AliveState::Registry.new
      registry.instance_eval(&block)
      @applications ||= []
      @applications += registry.application
    end

    def applications
      @applications
    end
  end
end

AliveState::Configure.setup

AliveState.application do
  active_record { ActiveRecord::Base.connection.execute('select 1') } if defined? ActiveRecord
end

require 'alive_state/rails' if defined? Rails::Railtie
