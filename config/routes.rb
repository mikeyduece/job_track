Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, header: { name: 'Accept', value: 'application/vnd.api+json' } do
    namespace :v1 do
      namespace :admin do
        resources :users, module: :users, only: %i[index show update destroy]
      
      end
      
      resource :profile, module: :profile, controller: :profile, only: :show
      resource :users, module: :users
      resources :job_applications, module: :job_applications
      
    end
  end
end
