module AliveState
  class Railtie < Rails::Railtie
    initializer "alive_state.configure_rails_initialization" do
      if use_alive_state?
        insert_middleware
      end
    end

    def insert_middleware
      if defined? ActionDispatch::DebugExceptions
        app.middleware.insert_after ActionDispatch::DebugExceptions, AliveState::Middleware
      else
        app.middleware.use AliveState::Middleware
      end
    end

    def use_alive_state?
      !Rails.env.production? and app.config.consider_all_requests_local
    end

    def app
      Rails.application
    end
  end
end
