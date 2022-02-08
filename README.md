# SIWERails
Rails gem that adds SIWE local sign in routes.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "siwe_rails"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install siwe_rails
```

## Usage
To use this plugin, just add `SiweRails::Engine` to your routes.

**Observe that the prefix where the routes are mounted must be set
correctly in the configuration step that follows.**

```ruby
require 'siwe_rails'

Rails.application.routes.draw do
  # other routes

  mount SiweRails::Engine => '/my-prefix'

  get '/auth/siwe/callback', to: 'my_controller#siwe_callback'
end
```

The available configuration options are listed below:

```ruby
config.x.siwe.prefix = 'my-prefix' # Prefix where the routes are mounted
config.x.siwe.statement = 'SIWE' # Message statement
config.x.siwe.expiration_time = 7 * 24 * 60 * 60 * 1000 # Message expiration time in milliseconds, 7 days by default
config.x.siwe.not_before = Time.now.utc.iso8601 # Message minimum datetime validity
config.x.siwe.request_id = false # Whether to add a request id
config.x.siwe.resources = nil # Resources
config.x.siwe.redirect_uri = '/auth/siwe/callback' # Redirect URL to receive user information on success

config.x.siwe.network = 'mainnet' # Network to use with sign in

config.x.siwe.infura = '898a72d2b3bd05900ac4582bcbb4dbdb' # Infura Key
config.x.siwe.portis = '3c128237-4235-472f-8223-3963111a9847' # Portis ID
config.x.siwe.fortmatic = 'pk_live_CBBD80D845392BAC' # Fortmatic Key

config.x.siwe.torus = true # Whether to enable Torus wallet
config.x.siwe.coinbase = true # Whether to enable Coinbase wallet, also requires Infura Key
```

The front-end resources must be listed in your manifest like shown below:

```
//= link siwe_rails/application.css
//= link siwe_rails/background.css
//= link siwe_rails/coinbase.svg
//= link siwe_rails/modal_icon.png
//= link siwe_rails/swe-landing.svg
//= link siwe_rails/web3bundle.js
//= link siwe_rails/siwe.js
```

### Callback

The callback will have the address and ens domain, if present,
available in the session object.

```ruby
  def siwe_callback
    session[SiweRails.SIWE_ADDRESS]
    session[SiweRails.SIWE_ENS]
  end
```

You can then use that to:
- Tie the account to a previous user of your application
(email, username, etc);
- Create a new account with the address/ens, or sign in.
