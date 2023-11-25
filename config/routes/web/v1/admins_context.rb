scope module: :admins_context do
  namespace :admins do
    resources :sessions, only: %i[] do
      collection do
        post :sign_in
        post :sign_up
        get :show
      end
    end
  end
end
