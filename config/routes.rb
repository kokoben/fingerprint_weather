Rails.application.routes.draw do
  root controller: :locations, action: :index

  resources :locations, only: %i[index show]
end
