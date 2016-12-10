Rails.application.routes.draw do
  get 'auth/github', as: 'github_auth'
  get 'auth/:provider/callback', to: 'session#create'
  get '/auth/failure', to: 'pages#home'

  get 'logout', to: 'session#destroy'

  root 'pages#home'
end
