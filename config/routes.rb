Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    resources :registrations
    resources :likes
  end

  resource :session, only: %i[new create destroy]

  resources :users
  get 'signup' => 'users#new'

  # get 'events' => 'events#index'
  # get 'evens/new' => 'events#new'
  # get 'events/:id' => 'events#show', as: 'event'
  # get 'events/:id/edit' => 'events#edit', as: 'edit_event'
  # patch 'events/:id' => 'events#update'
end
