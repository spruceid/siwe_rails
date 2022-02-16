SiweRails::Engine.routes.draw do
  root to: 'application#index'

  post 'message' => 'application#message'
  post 'signature' => 'application#signature'
end
