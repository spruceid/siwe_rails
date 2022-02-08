# frozen_string_literal: true

require 'siwe_rails/version'
require 'siwe_rails/engine'

module SiweRails
  SIWE_ADDRESS = 'siwe/address' # Session address key
  SIWE_ENS = 'siwe/ens' # Session address key

  # Prefix to use when mounting the routes
  def prefix
    if Rails.application.x.siwe.prefix.nil?
      'siwe'
    else
      Rails.application.x.siwe.prefix
    end
  end

  # Message statement
  def statement
    if Rails.application.x.siwe.statement.nil?
      'SIWE'
    else
      Rails.application.x.siwe.statement
    end
  end

  # Message expiration time in milliseconds, 7 days by default
  def expiration_time
    if Rails.application.x.siwe.expiration_time.nil?
      7 * 24 * 60 * 60 * 1000
    else
      Rails.application.x.siwe.expiration_time
    end
  end

  # Message minimum datetime validity
  def not_before
    if Rails.application.x.siwe.not_before.nil?
      Time.now.utc.iso8601
    else
      Rails.application.x.siwe.not_before
    end
  end

  # Whether to add a request id
  def request_id
    if Rails.application.x.siwe.request_id.nil?
      false
    else
      Rails.application.x.siwe.request_id
    end
  end

  # Resources
  def resources
    if Rails.application.x.siwe.resources.nil?
      nil
    else
      Rails.application.x.siwe.resources
    end
  end

  # Redirect URL to receive user information on success
  def redirect_uri
    if Rails.application.x.siwe.redirect_uri.nil?
      '/'
    else
      Rails.application.x.siwe.redirect_uri
    end
  end

  # Network to use with sign in
  def network
    if Rails.application.x.siwe.network.nil?
      'mainnet'
    else
      Rails.application.x.siwe.network
    end
  end

  # Infura Key
  def infura
    if Rails.application.x.siwe.infura.nil?
      ''
    else
      Rails.application.x.siwe.infura
    end
  end

  # Portis ID
  def portis
    if Rails.application.x.siwe.portis.nil?
      ''
    else
      Rails.application.x.siwe.portis
    end
  end

  # Fortmatic Key
  def fortmatic
    if Rails.application.x.siwe.fortmatic.nil?
      ''
    else
      Rails.application.x.siwe.fortmatic
    end
  end

  # Whether to enable Torus wallet
  def torus
    if Rails.application.x.siwe.torus.nil?
      false
    else
      Rails.application.x.siwe.torus
    end
  end

  # Whether to enable Coinbase wallet
  def coinbase
    if Rails.application.x.siwe.coinbase.nil?
      false
    else
      Rails.application.x.siwe.coinbase
    end
  end

  def self.setup
    yield self
  end
end
