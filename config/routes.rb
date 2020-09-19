Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, headers: { name: 'Content-Type', value: 'application/vnd.api+json' } do
    namespace :v1 do
      namespace :admin do
        resources :users, module: :users, only: %i[index show update destroy]

      end

      resource :users, module: :users
      resources :job_applications, module: :job_applications
    end
  end
end
