Rails.application.routes.draw do
  api_version(module: 'Api::V1', header: { name: 'Accept', value: 'application/vnd.job-track.json; version=1' }, defaults: { format: :json }) do
    scope module: :api do
      scope module: :v1 do
        namespace :admin do
          resources :users, module: :users, only: %i[index show update destroy]
        end
        
        resource :profile, module: :profile, controller: :profile, only: :show
        resource :users, module: :users
        resources :job_applications, module: :job_applications
        
      end
    end
  end
  
end
