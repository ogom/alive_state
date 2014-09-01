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

### Example

Put this line to your `config/initializers/alive_state.rb`:

```
AliveState.configure do |config|
  config.path = 'info/status'
  config.format = 'xml'
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
  "observed_at": "2014-03-21T12:34:56.789",
  "application": {
    "active_record": true,
    "active_ldap": true,
    "sidekiq": true
  }
}
```
