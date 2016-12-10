Rails.application.routes.draw do
  get 'session/create'

  get 'session/destroy'

  root "pages#home"
end
