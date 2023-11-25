scope module: :feeds_context do
  namespace :as_client do
    resources :feeds, only: %i[index create]
  end

  namespace :as_manager do
    resources :feeds, only: %i[index create] do
      scope module: :feeds do
        resource :cancellations, only: :create
        resource :confirmations, only: :create
      end
    end
  end
end
