Rails.application.routes.draw do
  get 'plans/create'

  root to: 'welcome#index'
  get '/home', to: 'welcome#home'
  get '/logout', to: 'welcome#logout'
  get 'strava_auth', to: 'welcome#strava_auth'

  resources :plans
end
