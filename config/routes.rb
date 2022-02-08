SiweRails::Engine.routes.draw do
  scope 'siwe' do
    root to: 'application#index'

    post 'message' => 'application#message'
    post 'signature' => 'application#signature'
  end
end
