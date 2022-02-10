# frozen_string_literal: true

require 'siwe_rails/version'
require 'siwe_rails/engine'

module SiweRails
  # Session address key
  def self.SIWE_ADDRESS
    'siwe/address'
  end

  # Session address key
  def self.SIWE_ENS
    'siwe/ens'
  end

  # Prefix to use when mounting the routes
  def self.prefix
    if Rails.configuration.x.siwe.prefix.nil?
      'siwe'
    else
      Rails.configuration.x.siwe.prefix
    end
  end

  # Message statement
  def self.statement
    if Rails.configuration.x.siwe.statement.nil?
      'SIWE'
    else
      Rails.configuration.x.siwe.statement
    end
  end

  # Message expiration time in milliseconds, 7 days by default
  def self.expiration_time
    if Rails.configuration.x.siwe.expiration_time.nil?
      7 * 24 * 60 * 60 * 1000
    else
      Rails.configuration.x.siwe.expiration_time
    end
  end

  # Message minimum datetime validity
  def self.not_before
    if Rails.configuration.x.siwe.not_before.nil?
      Time.now.utc.iso8601
    else
      Rails.configuration.x.siwe.not_before
    end
  end

  # Whether to add a request id
  def self.request_id
    if Rails.configuration.x.siwe.request_id.nil?
      false
    else
      Rails.configuration.x.siwe.request_id
    end
  end

  # Resources
  def self.resources
    if Rails.configuration.x.siwe.resources.nil?
      nil
    else
      Rails.configuration.x.siwe.resources
    end
  end

  # Redirect URL to receive user information on success
  def self.redirect_uri
    if Rails.configuration.x.siwe.redirect_uri.nil?
      '/'
    else
      Rails.configuration.x.siwe.redirect_uri
    end
  end

  # Network to use with sign in
  def self.network
    if Rails.configuration.x.siwe.network.nil?
      'mainnet'
    else
      Rails.configuration.x.siwe.network
    end
  end

  # Infura Key
  def self.infura
    if Rails.configuration.x.siwe.infura.nil?
      ''
    else
      Rails.configuration.x.siwe.infura
    end
  end

  # Portis ID
  def self.portis
    if Rails.configuration.x.siwe.portis.nil?
      ''
    else
      Rails.configuration.x.siwe.portis
    end
  end

  # Fortmatic Key
  def self.fortmatic
    if Rails.configuration.x.siwe.fortmatic.nil?
      ''
    else
      Rails.configuration.x.siwe.fortmatic
    end
  end

  # Whether to enable Torus wallet
  def self.torus
    if Rails.configuration.x.siwe.torus.nil?
      false
    else
      Rails.configuration.x.siwe.torus
    end
  end

  # Whether to enable Coinbase wallet
  def self.coinbase
    if Rails.configuration.x.siwe.coinbase.nil?
      false
    else
      Rails.configuration.x.siwe.coinbase
    end
  end

  def self.setup
    yield self
  end
end
