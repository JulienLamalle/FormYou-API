Rails.application.routes.draw do

  default_url_options :host => "https://form-you-api-staging.herokuapp.com/"

  namespace :api, defaults: { format: :json } do
    resources :users
    resources :categories
    resources :formation_attendances
    resources :formation_categories
    resources :rooms
    resources :roles

    resources :formations do 
      resources :formation_sessions
    end

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
