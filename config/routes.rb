Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
