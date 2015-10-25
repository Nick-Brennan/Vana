Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/home', to: 'welcome#home'
  get 'strava_auth', to: 'welcome#strava_auth'
end
