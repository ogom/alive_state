module AliveState
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      path, format = env['PATH_INFO'].split('.')
      case path
      when /^\/#{AliveState.config.path}/
        alive_state_call(env, format)
      else
        @app.call(env)
      end
    end

    def alive_state_call(env, format)
      format ||= AliveState.config.format

      status = 200
      params = { 'Content-Type' => 'text/plain; charset=utf-8' }
      raw = {
        state: :green,
        observed_at: Time.current.to_s,
        version: AliveState::Info.version_format,
        application: {}
      }

      AliveState.applications.each do |application|
        raw[:application][application.name] = application.alive?
      end

      raw[:application].keys.each do |key|
        unless raw[:application][key]
          raw[:state] = :red
          break
        end
      end

      case format
      when 'json'
        body = raw.to_json
        params = { 'Content-Type' => 'application/json' }
      when 'xml'
        body = raw.to_xml
        params = { 'Content-Type' => 'application/xml' }
      else
        body = raw.to_s
      end

      [status, params, [body]]
    end
  end
end
