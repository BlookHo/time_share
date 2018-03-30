Rails.application.routes.draw do
  # for REST API:
  resources :resorts, :only => [:index, :show]

  post '/graphql', to: 'graphql#execute'
  get '/graphql', to: 'graphql#execute'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/graphql', to: 'graphql#query'
  # get '/graphql', to: 'graphql#create'
  # resources :graphql, only: :create

  # Mount graphiql
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
end
