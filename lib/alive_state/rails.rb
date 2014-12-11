module AliveState
  class Railtie < Rails::Railtie
    initializer "alive_state.configure_rails_initialization" do
      insert_middleware
    end

    def insert_middleware
      if AliveState.config.insert_middleware and defined? ActionDispatch::DebugExceptions
        app.middleware.insert_after ActionDispatch::DebugExceptions, AliveState::Middleware
      else
        app.middleware.use AliveState::Middleware
      end
    end

    def app
      Rails.application
    end
  end
end
