scope module: :managers_context do
  namespace :managers do
    resources :sessions, only: %i[] do
      collection do
        post :sign_in
        post :sign_up
        get :show
      end
    end
  end
end
