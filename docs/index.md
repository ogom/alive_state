---
layout: default
title:  Documentation
---

## Configure

Set the configuration.

* path - Request URL.
  * Default: `status`
* format - Response Content-Type. (`json` or `xml` or `text`)
  * Default: `json`
* insert_middleware - middleware insert after **ActionDispatch::DebugExceptions**
  * Default: `true`

### Example

#### path and format

Put this line to your `config/initializers/alive_state.rb`:

```
AliveState.configure do |config|
  config.path = 'info/status'
  config.format = 'xml'
end
```

#### middleware use behind

Put this line to your `config/application.rb`:

```
module Railsnew
  class Application < Rails::Application
    AliveState.config.insert_middleware = false
  end
end
```

## Application

Set the code of application to observe on block.

### Example

Put this line to your `config/initializers/alive_state.rb`:

```
AliveState.application do
  active_ldap { ActiveLdap::Base.all(limit: 1) }
  sidekiq do
    Sidekiq.redis { |conn| conn.ping }
  end
end
```

Response in the format of json:

```
{
  "state": "green",
  "observed_at": "2014-03-21T12:34:56.789Z",
  "application": {
    "active_record": true,
    "active_ldap": true,
    "sidekiq": true
  }
}
```
