Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end
    post 'users/follow', to: 'users/follows#create', as: :follow
    delete 'users/follow', to: 'users/follows#destroy', as: :unfollow

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
