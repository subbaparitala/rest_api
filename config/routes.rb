Rails.application.routes.draw do
  resources :posts
  resources :users
namespace :api, defaults:{ format: :json } do
  namespace :v1 do

    end
  end 
end
