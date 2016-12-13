Rails.application.routes.draw do
  get 'account/show', as: 'github_account_information'

  get 'auth/github', as: 'github_auth'
  get 'auth/:provider/callback', to: 'session#create'
  get '/auth/failure', to: 'pages#home'

  get 'logout', to: 'session#destroy'

  get '*unmatched_route', to: 'application#not_found'
  root 'pages#home'
end
