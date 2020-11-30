Rails.application.routes.draw do

  default_url_options :host => "https://form-you-api-staging.herokuapp.com/"
  
  resources :categories
  resources :formation_sessions
  resources :formation_attendances
  resources :formation_categories
  resources :formations
  resources :rooms
  resources :roles


  namespace :api, defaults: { format: :json } do
    resources :users
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end
