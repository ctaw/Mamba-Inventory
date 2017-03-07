Rails.application.routes.draw do
  devise_for :user, :path => '', :path_names => {:sign_in => 'login', :sign_up => 'register'}

  root :to => "admin/dashboard#index"
  resource :sessions, only: [:new, :create, :destroy]
  delete 'logout' => 'sessions#destroy'

  # Administration
  namespace :admin do
    resources :dashboard

    namespace :inventory do
      resources :items
    end

    namespace :pos do
      resources :sales
      resources :reports
    end

    resources :setting_module, only: [:index]

    namespace :setting_module do
      resources :categories
      resources :category_types
      resources :units
    end

  end

  # # API
  # namespace :api do
  #   namespace :v1 do
  #     resources :categories, only: [:index, :create, :destroy, :update]
  #   end
  # end

end
