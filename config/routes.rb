Rails.application.routes.draw do
  root 'events#index'
  
  resources :events
  
  # get 'events' => 'events#index'
  # get 'evens/new' => 'events#new'
  # get 'events/:id' => 'events#show', as: 'event'
  # get 'events/:id/edit' => 'events#edit', as: 'edit_event'
  # patch 'events/:id' => 'events#update'
end
