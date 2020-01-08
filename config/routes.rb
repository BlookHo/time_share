Rails.application.routes.draw do
  # demo for rack-mini-profiler gem
  get 'performance_tests/index'
  get '/performance_tests', to: 'performance_tests#index'

  # for REST API:
  scope module: 'api' do
    namespace :v1 do
      resources :apartments
      resources :resorts do
        resources :apartments
      end
    end
  end

  # for GraphQL API:
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/graphql', to: 'graphql#execute'
  get '/graphql', to: 'graphql#execute'

  # Mount graphiql
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  match "*path", to: "application#catch_404", via: :all
end
