Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :boards do
        member do
          post 'discover'
        end
      end

    end
  end

end
